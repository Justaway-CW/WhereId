<?php

namespace App\Http\Controllers;

use App\Models\Province;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class AdminProvinceController extends Controller
{
    public function index(){
        if(Auth::check()){
            if(auth()->user()->role === config('app.admin_key')){
                $directory = 'public/assets/temp';
                $files = Storage::files($directory);
                foreach($files as $file) {
                    Storage::delete($file);
                }
                $datas = Province::select()->orderBy('id');
                if(request()->has('search')){
                    $datas = $datas->where('keyname', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('name', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('id', 'like', '%'. request()->get('search','') .'%');
                }
                $datas = $datas->paginate(10);
                return view('admin.province.index', compact('datas'));
            }else{
                abort(404,"Not found");
            }
        }else{
            abort(404,"Not found");
        }
    }
    public function create(){
        if(auth()->user()->role === config('app.admin_key')){
            return view('admin.province.create');
        }else{
            abort(404,"Not found");
        }
    }

    public function store(){

        $validated = request()->validate([
            'keyname' => 'required|unique:provinces,keyname',
            'name' => 'required',
        ]);


        $user = Province::create(
            [
                'keyname' => $validated['keyname'],
                'name' => $validated['name'],
            ]
        );

        return redirect()->route('admin_provinces.index');

    }

    public function show($id){
        if(auth()->user()->role === config('app.admin_key')){
            $data = Province::where('id',$id)->firstOrFail();
            return view('admin.province.show', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function edit($id){
        if(auth()->user()->role === config('app.admin_key')){
            $data = Province::where('id',$id)->firstOrFail();
            return view('admin.province.edit', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function update($id){
        $user = Province::where('id',$id)->firstOrFail();
        $validated = request()->validate([
            'keyname' => 'required',
            'name' => 'required'
        ]);

        try {
            $user->update([
                'keyname' => $validated['keyname'],
                'name' => $validated['name'],
            ]);
        } catch (\Exception $e) {
            // Handle the exception
            return redirect()->route('admin_provinces.edit', $id)->with('error',$e->getMessage());
            // Optionally, return an error response to the user
        }



        return redirect()->route('admin_provinces.index');
    }

    public function destroy($id){
        $data = Province::where('id',$id)->firstOrFail();

        $data->delete();

        return redirect()->route('admin_provinces.index');
    }
}
