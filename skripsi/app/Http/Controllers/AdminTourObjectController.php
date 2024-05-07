<?php

namespace App\Http\Controllers;

use App\Models\Province;
use App\Models\TourObject;
use App\Models\TourType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class AdminTourObjectController extends Controller
{
    public function index(){
        if(Auth::check()){
            if(auth()->user()->role === config('app.admin_key')){
                $directory = 'public/assets/temp';

                // Get all files in the directory
                $files = Storage::files($directory);

                // Iterate through each file and delete it
                foreach($files as $file) {
                    Storage::delete($file);
                }

                $datas = TourObject::select()->orderBy('id');

                //utk search bar
                if(request()->has('search')){
                    $datas = TourObject::select()->leftJoin('provinces', 'tour_objects.province_id', '=', 'provinces.id')
                    ->leftJoin('tour_types', 'tour_objects.tour_type_id', '=', 'tour_types.id')
                    ->orderBy('tour_objects.id');

                    $datas = $datas->select
                    ('tour_objects.id','tour_objects.name', 'tour_objects.tour_type_id','tour_objects.province_id'
                    ,'tour_objects.distance','tour_objects.price','tour_objects.rating','tour_objects.review')
                    ->where('tour_objects.name', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('tour_objects.id', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('provinces.name', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('provinces.keyname', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('tour_types.keyname', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('tour_types.type', 'like', '%'. request()->get('search','') .'%');

                    // dd($datas->get());
                }
                $datas = $datas->paginate(10);
                return view('admin.tour-object.index', compact('datas'));
            }else{
                abort(404,"Not found");
            }
        }else{
            abort(404,"Not found");
        }
    }
    public function create(){
        if(auth()->user()->role === config('app.admin_key')){
            $directory = 'public/assets/temp';

            // Get all files in the directory
            $files = Storage::files($directory);

            // Iterate through each file and delete it
            foreach($files as $file) {
                Storage::delete($file);
            }

            $tourTypes = TourType::get();
            $provinces = Province::get();
            return view('admin.tour-object.create', compact('tourTypes','provinces'));
        }else{
            abort(404,"Not found");
        }
    }

    public function store(){

        $validated = request()->validate([
                'name' => 'required|min:3|max:255',
                'tourtype' => 'required',
                'province' =>  'required',
                'distance' =>  'required|numeric|min:0',
                'price' =>  'required|numeric|min:0',
                'rating' =>  'required|numeric|min:1|max:5',
                'review' =>  'required|numeric|min:1',
                'description' => '',
                'location' => '',
                'note' => '',
                'image' =>  'image',
        ]);

        if(request()->has('image')){
            $filePath = request()->file('image')->store('assets/temp','public');
            $filePath2 = "storage/".$filePath;
            $imagesData = file_get_contents(public_path($filePath2));
            $imageEncode = base64_encode($imagesData);
            $validated['image'] = $imageEncode;
            Storage::disk('public')->delete($filePath ?? '');

            $user = TourObject::create(
                [
                    'name' => $validated['name'],
                    'tour_type_id' =>  $validated['tourtype'],
                    'province_id' =>  $validated['province'],
                    'distance' =>  $validated['distance'],
                    'price' =>  $validated['price'],
                    'rating' =>  $validated['rating'],
                    'review' =>  $validated['review'],
                    'description' =>  $validated['description'],
                    'location' =>  $validated['location'],
                    'note' => $validated['note'],
                    'image' =>  $validated['image']
                ]
            );
        }else{
            $user = TourObject::create(
                [
                    'name' => $validated['name'],
                    'tour_type_id' =>  $validated['tourtype'],
                    'province_id' =>  $validated['province'],
                    'distance' =>  $validated['distance'],
                    'price' =>  $validated['price'],
                    'rating' =>  $validated['rating'],
                    'review' =>  $validated['review'],
                    'description' =>  $validated['description'],
                    'location' =>  $validated['location'],
                    'note' => $validated['note']
                ]
            );
        }
        return redirect()->route('admin_tour_objects.index');
    }

    public function show($id){
        if(auth()->user()->role === config('app.admin_key')){
            $directory = 'public/assets/temp';

            // Get all files in the directory
            $files = Storage::files($directory);

            // Iterate through each file and delete it
            foreach($files as $file) {
                Storage::delete($file);
            }

            $data = TourObject::where('id',$id)->firstOrFail();
            if($data->image != null){

                $decoded_img = base64_decode($data->image);
                file_put_contents(public_path("storage/assets/temp/".$data->id.".png"), $decoded_img);
                 $data->image = asset('/storage/assets/temp/'.$data->id .'.png');
            }else{
                $data->image = "https://dummyimage.com/800x400/c7c7c7/000000&text=_";
            }

            return view('admin.tour-object.show', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function edit($id){
        if(auth()->user()->role === config('app.admin_key')){
            $directory = 'public/assets/temp';

            // Get all files in the directory
            $files = Storage::files($directory);

            // Iterate through each file and delete it
            foreach($files as $file) {
                Storage::delete($file);
            }

            $data = TourObject::where('id',$id)->firstOrFail();
            $tourTypes = TourType::get();
            $provinces = Province::get();
            if($data->image != null){

                $decoded_img = base64_decode($data->image);
                file_put_contents(public_path("storage/assets/temp/".$data->id.".png"), $decoded_img);
                $data->image = asset('/storage/assets/temp/'.$data->id .'.png');
            }else{
                $data->image = "https://dummyimage.com/800x400/c7c7c7/000000&text=_";
            }

            return view('admin.tour-object.edit', compact('data', 'tourTypes', 'provinces'));
        }else{
            abort(404,"Not found");
        }
    }

    public function update($id){
        $user = TourObject::where('id',$id)->firstOrFail();

        $validated = request()->validate([
            'name' => 'required|min:3|max:255',
            'tourtype' => 'required',
            'province' =>  'required',
            'distance' =>  'required|numeric|min:0',
            'price' =>  'required|numeric|min:0',
            'rating' =>  'required|numeric|min:1|max:5',
            'review' =>  'required|numeric|min:1',
            'description' => '',
            'location' => '',
            'note' => '',
            'image' =>  'image',
        ]);

        if(request()->has('image')){
            $filePath = request()->file('image')->store('assets/temp','public');
            $filePath2 = "storage/".$filePath;
            $imagesData = file_get_contents(public_path($filePath2));
            $imageEncode = base64_encode($imagesData);
            $validated['image'] = $imageEncode;
            Storage::disk('public')->delete($filePath ?? '');
            try {
                $user->update([
                    'name' => $validated['name'],
                    'tour_type_id' => $validated['tourtype'],
                    'province_id' => $validated['province'],
                    'distance' => $validated['distance'],
                    'price' => $validated['price'],
                    'rating' => $validated['rating'],
                    'review' => $validated['review'],
                    'description' => $validated['description'],
                    'location' => $validated['location'],
                    'note' => $validated['note'],
                    'image' => $validated['image']
                ]);
            } catch (\Exception $e) {
                return redirect()->route('admin_tour_objects.edit', $id)->with('error','Query Error Occurred!'. $e->getMessage());
            }
        }else{
            try {
                $user->update([
                    'name' => $validated['name'],
                    'tour_type_id' => $validated['tourtype'],
                    'province_id' => $validated['province'],
                    'distance' => $validated['distance'],
                    'price' => $validated['price'],
                    'rating' => $validated['rating'],
                    'review' => $validated['review'],
                    'description' => $validated['description'],
                    'location' => $validated['location'],
                    'note' => $validated['note'],
                ]);
            } catch (\Exception $e) {
                return redirect()->route('admin_tour_objects.edit', $id)->with('error',$e->getMessage());
            }
        }


        return redirect()->route('admin_tour_objects.index');
    }

    public function destroy($id){
        $data = TourObject::where('id',$id)->firstOrFail();

        $data->delete();

        return redirect()->route('admin_tour_objects.index');
    }
}
