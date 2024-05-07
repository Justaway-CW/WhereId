<?php

namespace App\Http\Controllers;

use App\Models\TourType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class AdminTourTypeController extends Controller
{
    public function index(){
        if(Auth::check()){
            if(auth()->user()->role === config('app.admin_key')){
                $directory = 'public/assets/temp';
                $files = Storage::files($directory);
                foreach($files as $file) {
                    Storage::delete($file);
                }

                $datas = TourType::select()->orderBy('id');
                if(request()->has('search')){
                    $datas = $datas->where('keyname', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('type', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('id', 'like', '%'. request()->get('search','') .'%');
                }
                $datas = $datas->paginate(10);

                return view('admin.tour-type.index', compact('datas'));
            }else{
                abort(404,"Not found");
            }
        }else{
            abort(404,"Not found");
        }
    }
    public function create(){
        if(auth()->user()->role === config('app.admin_key')){
            return view('admin.tour-type.create');
        }else{
            abort(404,"Not found");
        }

    }

    public function store(){

        $validated = request()->validate([
            'keyname' => 'required|unique:tour_types,keyname',
            'type' => 'required',
        ]);


        $user = TourType::create(
            [
                'keyname' => $validated['keyname'],
                'type' => $validated['type'],
            ]
        );

        return redirect()->route('admin_tour_types.index');

    }

    public function show($id){
        if(auth()->user()->role === config('app.admin_key')){
            $data = TourType::where('id',$id)->firstOrFail();
            return view('admin.tour-type.show', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function edit($id){
        if(auth()->user()->role === config('app.admin_key')){
            $data = TourType::where('id',$id)->firstOrFail();
            return view('admin.tour-type.edit', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function update($id){
        $user = TourType::where('id',$id)->firstOrFail();
        $validated = request()->validate([
            'keyname' => 'required',
            'type' => 'required'
        ]);

        try {
            $user->update([
                'keyname' => $validated['keyname'],
                'type' => $validated['type'],
            ]);
        } catch (\Exception $e) {
            // Handle the exception
            return redirect()->route('admin_tour_types.edit', $id)->with('error',$e->getMessage());
            // Optionally, return an error response to the user
        }



        return redirect()->route('admin_tour_types.index');
    }

    public function destroy($id){
        $data = TourType::where('id',$id)->firstOrFail();

        $data->delete();

        return redirect()->route('admin_tour_types.index');
    }
}
