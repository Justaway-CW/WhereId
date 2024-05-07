<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\TourObject;
use Illuminate\Http\Request;
use PhpParser\Node\Expr\FuncCall;

class CommentController extends Controller
{
    public function store($id){
        request()->validate([
            'comment' => 'required|min:2|max:1000'
        ]);

        $tour_object = TourObject::where('id', $id)->firstOrFail();

        $comment = new Comment();
        $comment->tour_object_id = $tour_object->id;
        $comment->user_id = auth()->id();
        $comment->content = request()->get('comment');
        $comment->save();


        return redirect()->route('tourismobject.detail',$tour_object->id)->with('success', "Comment posted");
    }


    public function destroy($id){
        $comment = Comment::where('id',$id)->firstOrFail();
        $tour_object = TourObject::select()->where('id' , $comment->tour_object_id)->firstOrFail();
        $comment->delete();

        return redirect()->route('tourismobject.detail',$tour_object->id)->with('success', "Comment deleted");
    }
}
