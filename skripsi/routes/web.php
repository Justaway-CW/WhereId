<?php

use App\Http\Controllers\AdminProvinceController;
use App\Http\Controllers\AdminTourObjectController;
use App\Http\Controllers\AdminTourTypeController;
use App\Http\Controllers\AdminUserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\TourismObjectController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserFavouriteController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('homepage');

Route::get('/recommendation', [TourismObjectController::class, 'index'])->name('tourismobject.index');
Route::get('/recommendation/{tourobject}', [TourismObjectController::class, 'show'])->name('tourismobject.detail');

//route for auth
Route::get('/register', [AuthController::class, 'register'])->name('register');
Route::post('/register', [AuthController::class, 'store']);

Route::get('/login', [AuthController::class, 'login'])->name('login');
Route::post('/login', [AuthController::class, 'authenticate']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');


Route::resource('users', UserController::class)->only('show');
Route::resource('users', UserController::class)->only('edit','update')->middleware('auth');
Route::get('profile', [UserController::class, 'profile'])->name('profile')->middleware('auth');

//route for fav
Route::post('recommendation/{rank}/{id}/favourite', [UserFavouriteController::class ,'fav'])->name('favourite')->middleware('auth');
Route::post('recommendation/{id}/{from}/unfavourite', [UserFavouriteController::class,'unfav'])->name('unfavourite')->middleware('auth');

//admin route
Route::resource('admin_users', AdminUserController::class)->middleware('auth_abort');
Route::resource('admin_provinces', AdminProvinceController::class)->middleware('auth_abort');
Route::resource('admin_tour_types', AdminTourTypeController::class)->middleware('auth_abort');
Route::resource('admin_tour_objects', AdminTourObjectController::class)->middleware('auth_abort');


//comment route
Route::post('/tourobject/{tourobject}/comments', [CommentController::class, 'store'])->name('tourobject.comments.store')->middleware('auth');
Route::delete('/recommendation/{tourobject}/comments', [CommentController::class, 'destroy'])->name('tourobject.comments.destroy')->middleware('auth');
