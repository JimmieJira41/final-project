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

Route::get('/', function () {
    return view('welcome');
});
Route::get('/admin', function () {
    return view('admin');
});
Route::get('/order', function () {
    return view('order');
});
Route::get('/stock', function () {
    return view('stock');
});
Route::get('/customer', function () {
    return view('customer');
});
Route::get('/item', function () {
    return view('item');
});
Route::get('/analysis', function () {
    return view('analysis');
});

