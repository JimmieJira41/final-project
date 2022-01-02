<?php

use App\Http\Controllers\CustomerManagement;
use App\Http\Controllers\AdminManagement;
use App\Http\Controllers\OrderManagement;
use App\Http\Controllers\StockManagement;
use App\Http\Controllers\ItemManagement;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::prefix('customer')->group(function(){
    Route::post('/new-customer', [CustomerManagement::class, 'create']);
    Route::put('/update-customer', [CustomerManagement::class, 'update']);
    Route::delete('/delete-customer', [CustomerManagement::class, 'delete']);
    Route::get('/get-all-customer', [CustomerManagement::class, 'getAll']);
    Route::get('/search-by-id', [CustomerManagement:: class, 'searchById']);
});
Route::prefix('admin')->group(function(){
    Route::post('/new-admin',[AdminManagement::class, 'create']);
    Route::put('/update-admin', [AdminManagement::class, 'update']);
    Route::delete('/delete-admin', [AdminManagement::class, 'delete']);
    Route::get('/get-all-admin', [AdminManagement::class, 'getAll']);
    Route::get('/search-by-id', [AdminManagement:: class, 'searchById']);
});
Route::prefix('order')->group(function(){
    Route::post('/new-order',[OrderManagement::class, 'create']);
    Route::put('/update-order', [OrderManagement::class, 'update']);
    Route::delete('/delete-order', [OrderManagement::class, 'delete']);
    Route::get('/get-all-order', [OrderManagement::class, 'getAll']);
    // Route::get('/search-by-id', [OrderManagement:: class, 'searchById']);
});
Route::prefix('stock')->group(function(){
    Route::post('/new-stock',[StockManagement::class, 'create']);
    Route::put('/update-stock', [StockManagement::class, 'update']);
    Route::delete('/delete-stock', [StockManagement::class, 'delete']);
    Route::get('/get-all-stock', [StockManagement::class, 'getAll']);
    // Route::get('/search-by-id', [stockManagement:: class, 'searchById']);
});
Route::prefix('item')->group(function(){
    Route::post('/new-item',[ItemManagement::class, 'create']);
    Route::put('/update-item', [ItemManagement::class, 'update']);
    Route::delete('/delete-item', [ItemManagement::class, 'delete']);
    Route::get('/get-all-item', [ItemManagement::class, 'getAll']);
    // Route::get('/search-by-id', [stockManagement:: class, 'searchById']);
});