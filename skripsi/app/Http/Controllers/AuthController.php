<?php

namespace App\Http\Controllers;

use App\Models\Province;
use App\Models\TourType;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(){
        if(Auth::check()){
            return redirect()->route('homepage');
        }else{
            return view('auth.register');
        }
    }

    public function store(){
        $validated = request()->validate([
            'name' => 'required|min:3|max:40',
            'username' => 'required|unique:users,username',
            'password' => 'required|confirmed|min:8'
        ]);

        $user = User::create(
            [
                'display_name' => $validated['name'],
                'username' => $validated['username'],
                'password' => Hash::make($validated['password']),
                'role' => '1'
            ]
        );
        return redirect()->route('login')->with('success','Account created successfully!');
    }

    public function login(){
        if(Auth::check()){
            return redirect()->route('homepage');
        }else{
            return view('auth.login');
        }
    }

    public function authenticate(){
        $validated = request()->validate([
            'username' => 'required',
            'password' => 'required'
        ]);

        if(auth()->attempt($validated)){
            request()->session()->regenerate();
            if(auth()->user()->role === "1"){
                return redirect()->route('homepage');
            }else
            if(auth()->user()->role ===  config('app.admin_key')){
                return redirect()->route('admin_tour_objects.index');
            }else{
                auth()->logout();
                request()->session()->invalidate();
                request()->session()->regenerateToken();
                abort(404, 'Not Found');
            }

        }

        return redirect()->route('login')->withErrors([
            'password'=>"Invalid user or password."
        ]);

    }

    public function logout(){
        auth()->logout();

        request()->session()->invalidate();
        request()->session()->regenerateToken();

        return redirect()->route('homepage');
    }
}
