<?php

namespace App\Http\Controllers;

use App\Models\Province;
use App\Models\TourObject;
use App\Models\TourType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class UserFavouriteController extends Controller
{
    public function fav($rank, $id){
        $tourObject = TourObject::where('id', $id)->firstOrFail();
        $province = Province::where('id', $tourObject->province_id)->firstOrFail();
        $tourType = TourType::where('id', $tourObject->tour_type_id)->firstOrFail();
        $note = "No " . $rank . " attraction for " . $tourType->type . " in " . $province->name;

        $user = auth()->user();
        $user->favourite()->attach($tourObject, ['note' => $note]);

        $queryParams = [
            'province' => $province->keyname,
            'type' => $tourType->keyname,
        ];

        $url = route('tourismobject.index') . '?' . http_build_query($queryParams);


        return Redirect::to($url);
    }

    public function unfav($id, $from){
        $tourObject = TourObject::where('id', $id)->firstOrFail();
        $province = Province::where('id', $tourObject->province_id)->firstOrFail();
        $tourType = TourType::where('id', $tourObject->tour_type_id)->firstOrFail();

        $user = auth()->user();//logged in user
        $user->favourite()->detach($tourObject);


        if($from == 1){
            $queryParams = [
                'province' => $province->keyname,
                'type' => $tourType->keyname,
            ];

            $url = route('tourismobject.index') . '?' . http_build_query($queryParams);
            return Redirect::to($url);
        }else{
            return redirect()->route('profile');
        };

    }
}
