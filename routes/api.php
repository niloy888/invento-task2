<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;

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

Route::post('/auth/register', [AuthController::class, 'createUser']);
Route::post('/auth/login', [AuthController::class, 'loginUser']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('shorten', [UserController::class, 'shorten'])->name('shorten');
    Route::get('get_private_urls', [UserController::class, 'privateUrlList']);
    Route::get('url_list', [UserController::class, 'urlList']);
    Route::get('url_details_list/{id}', [UserController::class, 'urlDetailsList']);
    Route::delete('delete_record/{id}', [UserController::class, 'deleteRecord']);
});