<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class AdminUserController extends Controller
{
    public function index(){
        if(Auth::check()){
            if(auth()->user()->role === config('app.admin_key')){
                $directory = 'public/assets/temp';
                $files = Storage::files($directory);
                foreach($files as $file) {
                    Storage::delete($file);
                }
                $datas = User::select()->orderBy('id');
                if(request()->has('search')){
                    $datas = $datas->where('display_name', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('username', 'like', '%'. request()->get('search','') .'%')
                    ->orWhere('id', 'like', '%'. request()->get('search','') .'%');
                }
                $datas = $datas->paginate(10);
                return view('admin.user.index', compact('datas'));
            }else{
                abort(404,"Not found");
            }
        }else{
            abort(404,"Not found");
        }
    }

    public function create(){
        if(auth()->user()->role === config('app.admin_key')){
            return view('admin.user.create');
        }else{
            abort(404,"Not found");
        }
    }

    public function store(){

        $validated = request()->validate([
            'display_name'=>'required|min:3|max:40',
            'username'=>'required|unique:users,username',
            'bio'=>'',
            'role'=>'required',
            'password'=>'required|min:8'

        ]);

        $validated['password'] = Hash::make($validated['password']);

        if($validated['role'] == 'user'){
            $validated['role'] = 1;
        }
        else if($validated['role'] == 'admin'){
            $validated['role'] = config('app.admin_key');
        }

        User::create([
            'display_name'=>$validated['display_name'],
            'username'=>$validated['username'],
            'bio'=>$validated['bio'],
            'role'=>$validated['role'],
            'password'=>$validated['password'],
        ]);

        return redirect()->route('admin_users.index');

    }

    public function show($id){
        if(auth()->user()->role === config('app.admin_key')){
            $data = User::where('id',$id)->firstOrFail();
            if($data->role == "1"){
                $data->role = "user";
            }else if($data->role == config('app.admin_key')){
                $data->role = "admin";
            }

            return view('admin.user.show', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function edit($id){
        if(auth()->user()->role === config('app.admin_key')){
            $data = User::where('id',$id)->firstOrFail();
            if($data->role == "1"){
                $data->role = "user";
            }else if($data->role == config('app.admin_key')){
                $data->role = "admin";
            }

            return view('admin.user.edit', compact('data'));
        }else{
            abort(404,"Not found");
        }

    }

    public function update($id){
        $user = User::where('id',$id)->firstOrFail();
        $validated = request()->validate([
            'display_name'=>'required|min:3|max:40',
            'username'=>'required',
            'bio'=>'',
            'role'=>'required',
            'password'=>'required|min:8'
        ]);

        if($validated['role'] == 'user'){
            $validated['role'] = 1;
        }
        else if($validated['role'] == 'admin'){
            $validated['role'] = config('app.admin_key');
        }

        if($user->password == $validated['password']){
            try {
                $user->update([
                    'display_name'=>$validated['display_name'],
                    'username'=>$validated['username'],
                    'bio'=>$validated['bio'],
                    'role'=>$validated['role']
                ]);
            } catch (\Exception $e) {
                // Handle the exception
                return redirect()->route('admin_users.edit', $id)->with('error',$e->getMessage());
                // Optionally, return an error response to the user
            }

        }else{
            $validated['password'] = Hash::make($validated['password']);
            try {
                $user->update([
                    'display_name'=>$validated['display_name'],
                    'username'=>$validated['username'],
                    'bio'=>$validated['bio'],
                    'role'=>$validated['role'],
                    'password'=>$validated['password'],
                ]);
            } catch (\Exception $e) {
                // Handle the exception
                return redirect()->route('admin_users.edit', $id)->with('error',$e->getMessage());
                // Optionally, return an error response to the user
            }
        }

        return redirect()->route('admin_users.index');
    }

    public function destroy($id){
        $data = User::where('id',$id)->firstOrFail();

        $data->delete();

        return redirect()->route('admin_users.index');
    }
}
