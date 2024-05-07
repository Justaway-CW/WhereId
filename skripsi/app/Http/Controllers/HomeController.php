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
        $directory = 'public/assets/temp';
        $files = Storage::files($directory);
        foreach($files as $file) {
            Storage::delete($file);
        }

        $tourTypes = TourType::get();
        $provinces = Province::get();


        return view('homepage.homepage', compact('tourTypes','provinces'));
    }
}
