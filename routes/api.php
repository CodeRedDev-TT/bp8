<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', [App\Http\Controllers\Api\AuthController::class, 'login']);

Route::group(['middleware' => ['auth:api']], function() {
    Route::get('workouts', [App\Http\Controllers\Api\WorkoutController::class, 'getAll']);
    Route::get('workouts/today', [App\Http\Controllers\Api\WorkoutController::class, 'getWorkoutsForToday']);
    Route::get('workouts/{id}', [App\Http\Controllers\Api\WorkoutController::class, 'get']);
    Route::post('workouts/{id}/track', [App\Http\Controllers\Api\WorkoutController::class, 'track']);
    Route::get('workouts/{id}/track', [App\Http\Controllers\Api\WorkoutController::class, 'getTrack']);
});


