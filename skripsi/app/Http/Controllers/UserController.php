<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function show($user){
        // $ideas = $user->ideas()->paginate(5);

        // $totalLikes = 0;
        // foreach ($user->ideas as $idea) {
        //     $totalLikes += $idea->likes()->count();
        // }
            // dd($user);

        $directory = 'public/assets/temp';
        $files = Storage::files($directory);

        // Iterate through each file and delete it
        foreach ($files as $file) {
            Storage::delete($file);
        }

        $user =  User::where('username',$user)->firstOrFail();
        $favs = $user->favourite;

        foreach ($favs as &$fav) {
            if ($fav->image != null) {
                $decoded_img = base64_decode($fav->image);
                file_put_contents(public_path('storage/assets/temp/' . $fav->id . '.png'), $decoded_img);
                $fav->image = asset('/storage/assets/temp/'.$fav->id .'.png');
            }else{
                $fav->image = "https://dummyimage.com/800x400/c7c7c7/000000&text=_";
            }
        }
        unset($fav);
        return view('profile.show',compact('user', 'favs'));
        // return view('profile.show',compact('user'));
    }

    public function profile(){
        return $this->show(auth()->user()->username);
    }

    public function edit($username){

        $user = User::where('username',$username)->firstOrFail();
        $favs = $user->favourite;

        foreach ($favs as &$fav) {
            if ($fav->image != null) {
                $decoded_img = base64_decode($fav->image);
                file_put_contents(public_path('storage/assets/temp/' . $fav->id . '.png'), $decoded_img);
                $fav->image = asset('/storage/assets/temp/'.$fav->id .'.png');
            }else{
                $fav->image = "https://dummyimage.com/800x400/c7c7c7/000000&text=_";
            }
        }
        unset($fav);


        return view('profile.show', compact('user', 'favs'));
    }

    public function update(User $user){

        $validated = request()->validate(
            [
                'name' => 'required|min:3|max:40',
                'bio' => 'nullable|min:1|max:255'
            ]
        );

        // if(request()->has('image')){
        //     $imagePath = request()->file('image')->store('profile','public');
        //     $validated['image'] = $imagePath;
        //     Storage::disk('public')->delete($user->image ?? '');
        // }

        $user->update([
            'display_name' => $validated['name'],
            'bio' => $validated['bio']
        ]);

        return redirect()->route('profile');
    }
}
