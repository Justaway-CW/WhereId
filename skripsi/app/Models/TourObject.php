<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TourObject extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'tour_type_id',
        'province_id',
        'description',
        'location',
        'image',
        'note',
        'distance',
        'price',
        'rating',
        'review',
    ];


    public function favourite(){
        return $this->belongsToMany(User::class,'user_favourite')->withTimestamps()->withPivot('note');
    }
    public function tourType(){
        return $this->belongsTo(TourType::class);
    }
    public function province(){
        return $this->belongsTo(Province::class);
    }
    public function comments(){
        //cara asli (syntax parameter (class::class, [foreignkey dr table lain], [key dr table ini]))
        return $this->hasMany(Comment::class, 'tour_object_id', 'id');
        //id = key dr table ideas
        //idea_id = foreign key dr table comments

        // kalau penamaan foreign key sama primary key ikuti penulisan laravel bs lsg jd gini
        // return $this->hasMany(Comment::class);
    }

}
