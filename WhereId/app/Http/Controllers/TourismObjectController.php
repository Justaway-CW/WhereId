<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Province;
use App\Models\TourObject;
use App\Models\TourType;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class TourismObjectController extends Controller
{
    public function index()
    {
        // $validated = request()->validate([
        //     'province' => 'required',
        //     'type' => 'required'
        // ]);
        $directory = 'public/assets/temp';
        $files = Storage::files($directory);

        // Iterate through each file and delete it
        foreach ($files as $file) {
            Storage::delete($file);
        }

        $tourTypes = TourType::get();
        $provincesData = Province::get();
        $recommendations = [];
        if (request()->has('province', 'type')) {
            $provinceParam = request()->get('province', '');
            $typeParam = request()->get('type', '');
            if ($provinceParam != '' && $typeParam != '') {
                $province = Province::where('keyname', $provinceParam)->first();
                $type = TourType::where('keyname', $typeParam)->first();

                if($province == null || $type == null){
                    return view('tourism-object.tourism-object', compact('tourTypes', 'provincesData', 'recommendations'));
                }

                $datas = TourObject::where('province_id', $province->id)
                ->where('tour_type_id', $type->id)
                ->get();

                if (count($datas) > 1) {
                    $dataArray = $this->changeToArrayForm($datas);
                    $entropyWeight = $this->entropyWeightDetermination($dataArray);
                    // dd($entropyWeight);
                    $tourObjectRank = $this->simpleAdditiveWeighting($entropyWeight, $dataArray);
                    $x = 0;
                    while ($x < count($datas)) {
                        $datas[$x]['rankVal'] = $tourObjectRank[$x];
                        $datas[$x]['rank'] = 0;
                        $x++;
                    }
                    $arrayedData = $datas->toArray();

                    $ranks = array_column($arrayedData, 'rankVal');

                    // Sort the array based on the 'rank' column
                    array_multisort($ranks, SORT_DESC, $arrayedData);

                    $x = 1;
                    while ($x <= count($arrayedData)) {
                        $arrayedData[$x - 1]['rank'] = $x;
                        $x++;
                    }

                    $recommendations = $arrayedData;
                    foreach ($recommendations as &$recommendation) {
                        $recommendation['rankVal'] = number_format($recommendation['rankVal'], 4) * 100;
                        if ($recommendation['image'] != null) {
                            $decoded_img = base64_decode($recommendation['image']);
                            file_put_contents(public_path('storage/assets/temp/' . $recommendation['id'] . '.png'), $decoded_img);
                            $recommendation['image'] = asset('/storage/assets/temp/'.$recommendation['id'] . '.png');

                        }else{
                            $recommendation['image'] = "https://dummyimage.com/800x400/ebebeb/000000&text=_";
                        }
                        $recommendation['updated_at'] = $this->formatDate($recommendation['updated_at']);
                    }

                    unset($recommendation);
                }
            }
        }
        return view('tourism-object.tourism-object', compact('tourTypes', 'provincesData', 'recommendations'));
    }

    private function entropyWeightDetermination($datas)
    {
        $dataArray = $datas;
        $criteria = ['distance', 'price', 'rating', 'review'];
        // sum semua alternatif criteria

        $eachCriteriaSum[] = [];
        foreach ($criteria as $dataCriteria){
            $eachCriteriaSum[0][$dataCriteria] = 0;
        }

        foreach ($dataArray as $data) {
            foreach ($criteria as $dataCriteria){
                $eachCriteriaSum[0][$dataCriteria] += $data[$dataCriteria];
            };
        }

        // standarisasi tiap data = dataArray[0]['distance']/$eachCriteriaSum[0]['distance']
        foreach ($dataArray as &$data) {
            foreach ($criteria as $dataCriteria){
                $data[$dataCriteria] = $data[$dataCriteria] / $eachCriteriaSum[0][$dataCriteria];
            };
        };
        unset($data);

        // kali hasil normalisasi dengan log hasil normalisasi tsb
        foreach ($dataArray as &$data) {
            foreach ($criteria as $dataCriteria){
                $data[$dataCriteria] = $data[$dataCriteria] * log($data[$dataCriteria]);
            }
        }
        unset($data);

        //sum hasil kali normalisasi dengan log hasil normalisasi sebelumnya
        unset($eachCriteriaSum);

        $eachCriteriaSum[] = [];
        foreach ($criteria as $dataCriteria){
            $eachCriteriaSum[0][$dataCriteria] = 0;
        }

        foreach ($dataArray as $data) {
            foreach ($criteria as $dataCriteria){
                $eachCriteriaSum[0][$dataCriteria] += $data[$dataCriteria];
            }
        }
        // dd($eachCriteriaSum);

        //mencari nilai entropy tiap kriteria (ej)
        $h = log(count($dataArray));
        $ej = [];
        foreach ($criteria as $dataCriteria){
            $ej[$dataCriteria] = ($eachCriteriaSum[0][$dataCriteria] / $h) * -1;
        }

        //mencari nilai dj (1-ej)
        $dj = [];
        foreach ($criteria as $dataCriteria){
            $dj[$dataCriteria] =  1 - $ej[$dataCriteria];
        }

        //sum dj
        $djSum = 0;
        foreach ($criteria as $dataCriteria){
            $djSum += $dj[$dataCriteria];
        }

        //weight akhir tiap kriteria menggunakan entropy method
        $weightedCriteria[] = [];
        foreach ($criteria as $dataCriteria){
            $weightedCriteria[0][$dataCriteria] = $dj[$dataCriteria] / $djSum;
        }

        return $weightedCriteria;
    }

    private function simpleAdditiveWeighting($entropyWeight, $dataArray)
    {
        $criteria = ['distance', 'price', 'rating', 'review'];
        $eachCriteriaMinMax = [];
        // Buat array untuk mencari nilai min/max tiap criteria
        foreach ($dataArray as $data) {
            foreach ($criteria as $column) {
                $eachCriteriaMinMax[$column][] = $data[$column];
            }
        }

        // Buat matrix normalisasi Rij
        // distance & price = cost = min
        // rating & review = benefit = max
        foreach ($dataArray as &$data) {
            $data['distance'] = collect($eachCriteriaMinMax['distance'])->min() / $data['distance'];
            $data['price'] = collect($eachCriteriaMinMax['price'])->min() / $data['price'];
            $data['rating'] = $data['rating'] / collect($eachCriteriaMinMax['rating'])->max();
            $data['review'] = $data['review'] / collect($eachCriteriaMinMax['review'])->max();
        }
        unset($data);

        // mencari nilai Vi tiap data dengan weight * value matrix normalisasi (Rij)
        foreach ($dataArray as &$data) {
            foreach ($criteria as $criteriaType) {
                $data[$criteriaType] = $data[$criteriaType] * $entropyWeight[0][$criteriaType];
            }
        }
        unset($data);

        //Sum nilai preferensi Vi tiap alternatif
        foreach ($dataArray as $data) {
            $totalRank[] = array_sum($data);
        }
        return $totalRank;
    }

    private function changeToArrayForm($dataFromDb)
    {
        $dataArray = [];
        foreach ($dataFromDb as $data) {
            $dataArray[] = [
                'distance' => $data->distance,
                'price' => $data->price,
                'rating' => $data->rating,
                'review' => $data->review,
            ];
        }

        foreach($dataArray as &$data){
            if($data['price'] == 0){
                $data['price'] = 1;
            }
        }
        unset($data);
        return $dataArray;
    }

    public function show(TourObject $tourobject)
    {
        $directory = 'public/assets/temp';
        $files = Storage::files($directory);

        // Iterate through each file and delete it
        foreach ($files as $file) {
            Storage::delete($file);
        }
        if ($tourobject->image != null) {
            $decoded_img = base64_decode($tourobject->image);
            file_put_contents(public_path('storage/assets/temp/' . $tourobject->id . '.png'), $decoded_img);
             $tourobject->image = asset('/storage/assets/temp/' . $tourobject->id . '.png');
        }else{
            $tourobject->image = "https://dummyimage.com/800x400/c7c7c7/000000&text=_";
        }
        $comments = Comment::select()->where('tour_object_id', $tourobject->id)->orderBy('created_at','DESC')->paginate(10);
        return view('tourism-object.detail-content', compact('tourobject', 'comments'));
    }

    private function formatDate($dateTimeString)
    {
        $formattedDate = Carbon::parse($dateTimeString)->toDateString();
        return $formattedDate;
    }

}
