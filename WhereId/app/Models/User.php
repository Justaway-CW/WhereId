<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'username',
        'display_name',
        'role',
        'password',
        'image',
        'bio'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function favourite(){
        return $this->belongsToMany(TourObject::class,'user_favourite')->withTimestamps()->withPivot('note');
    }

    public function isFav($recommendation){
        $tourObject = TourObject::where('id',$recommendation['id'])->firstOrFail();
        return $this->favourite()->where('tour_object_id',$tourObject->id)->exists();
    }

    public function comments(){
        return $this->hasMany(Comment::class)->latest();
    }
}
