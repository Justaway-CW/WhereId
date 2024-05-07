<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TourType extends Model
{
    use HasFactory;

    protected $fillable = [
        'keyname',
        'type',
    ];
    public function tourObject(){
        return $this->hasMany(TourObject::class)->latest();//->orderBy("created_at","DESC");
    }
}
