<?php

use App\Http\Controllers\CustomerManagement;
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