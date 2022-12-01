<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();

Route::group(['middleware' => ['auth']], function() {
    Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::get('/category', [App\Http\Controllers\CategoryController::class, 'index'])->name('category');
    Route::get('/category/add', [App\Http\Controllers\CategoryController::class, 'create'])->name('category.add');
    Route::post('/category/store', [App\Http\Controllers\CategoryController::class, 'store'])->name('category.store');
    Route::get('/category/edit/{id}', [App\Http\Controllers\CategoryController::class, 'edit'])->name('category.edit');
    Route::post('/category/update/{id}', [App\Http\Controllers\CategoryController::class, 'update'])->name('category.update');
    Route::get('/category/destroy/{id}', [App\Http\Controllers\CategoryController::class, 'destroy'])->name('category.destroy');

    Route::get('/station', [App\Http\Controllers\StationController::class, 'index'])->name('station');
    Route::get('/station/add', [App\Http\Controllers\StationController::class, 'create'])->name('station.add');
    Route::post('/station/store', [App\Http\Controllers\StationController::class, 'store'])->name('station.store');
    Route::get('/station/edit/{id}', [App\Http\Controllers\StationController::class, 'edit'])->name('station.edit');
    Route::post('/station/update/{id}', [App\Http\Controllers\StationController::class, 'update'])->name('station.update');
    Route::get('/station/destroy/{id}', [App\Http\Controllers\StationController::class, 'destroy'])->name('station.destroy');

    Route::get('/workout', [App\Http\Controllers\WorkoutController::class, 'index'])->name('workout');
    Route::get('/workout/add', [App\Http\Controllers\WorkoutController::class, 'create'])->name('workout.add');
    Route::post('/workout/store', [App\Http\Controllers\WorkoutController::class, 'store'])->name('workout.store');
    Route::get('/workout/edit/{id}', [App\Http\Controllers\WorkoutController::class, 'edit'])->name('workout.edit');
    Route::post('/workout/update/{id}', [App\Http\Controllers\WorkoutController::class, 'update'])->name('workout.update');
    Route::get('/workout/destroy/{id}', [App\Http\Controllers\WorkoutController::class, 'destroy'])->name('workout.destroy');


    Route::post('/aiz-uploader', [App\Http\Controllers\AizUploadController::class, 'show_uploader']);
    Route::post('/aiz-uploader/upload', [App\Http\Controllers\AizUploadController::class, 'upload']);
    Route::get('/aiz-uploader/get_uploaded_files', [App\Http\Controllers\AizUploadController::class, 'get_uploaded_files']);
    Route::post('/aiz-uploader/get_file_by_ids', [App\Http\Controllers\AizUploadController::class, 'get_preview_files']);
    Route::get('/aiz-uploader/download/{id}', [App\Http\Controllers\AizUploadController::class, 'attachment_download'])->name('download_attachment');
    Route::post('/aiz-uploader/destroy/{id}', [App\Http\Controllers\AizUploadController::class, 'destroy']);

});

