<?php

use Illuminate\Support\Facades\Route;
use illuminate\Support\Facades\Auth;

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

Route::get('/', function () {
    return view('welcome');
})->name('/');

Route::get('/home', function () {

    if (Auth::user()->is_admin == 1) {
        return view('admin.home');
    }
    return view('user.home');
})->middleware(['auth'])->name('home');

Route::get('/private_urls', [App\Http\Controllers\HomeController::class, 'privateUrls'])->middleware(['auth'])->name('private_urls');

Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/url_list', [App\Http\Controllers\HomeController::class, 'urlList'])->name('url_list');
    Route::get('/url_details_list/{id}', [App\Http\Controllers\HomeController::class, 'urlDetailsList']);
});


Auth::routes();

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
