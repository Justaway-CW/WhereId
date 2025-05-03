<?php

namespace App\Http\Controllers;

use App\Models\Province;
use App\Models\TourType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class HomeController extends Controller
{
    public function index(){
        // $path = public_path('storage/assets/tour_objects_images/7 Layers Waterfalls.jpg');
        // $exist = file_exists($path);
        // dd($exist);
        $tourTypes = TourType::get();
        $provinces = Province::get();


        return view('homepage.homepage', compact('tourTypes','provinces'));
    }
}
