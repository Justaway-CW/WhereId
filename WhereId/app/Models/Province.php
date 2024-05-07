<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    use HasFactory;

    protected $fillable = [
        'keyname',
        'name',
    ];
    public function tourObject(){
        return $this->hasMany(TourObject::class)->latest();//->orderBy("created_at","DESC");
    }
}
