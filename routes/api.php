<?php

use App\Http\Controllers\AddressManagement;
use App\Http\Controllers\CustomerManagement;
use App\Http\Controllers\AdminManagement;
use App\Http\Controllers\AnalysisManagement;
use App\Http\Controllers\OrderManagement;
use App\Http\Controllers\StockManagement;
use App\Http\Controllers\ItemManagement;
use App\Http\Controllers\HistoryManagement;
use App\Http\Controllers\PromotionManagement;
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
    Route::get('/get-customer/{keyword}', [CustomerManagement::class, 'getCustomerById']);
    Route::get('/search-customer/{keyword}', [CustomerManagement:: class, 'searchCustomer']);
});
Route::prefix('admin')->group(function(){
    Route::post('/new-admin',[AdminManagement::class, 'create']);
    Route::put('/update-admin', [AdminManagement::class, 'update']);
    Route::delete('/delete-admin', [AdminManagement::class, 'delete']);
    Route::get('/get-all-admin', [AdminManagement::class, 'getAll']);
    Route::get('/get-admin/{keyword}', [AdminManagement::class, 'getAdminById']);
    Route::get('/search-admin/{keyword}', [AdminManagement:: class, 'searchAdmin']);
});
Route::prefix('order')->group(function(){
    Route::get('/prepare-order',[OrderManagement::class, 'prepareOrder']);
    Route::post('/new-order',[OrderManagement::class, 'create']);
    Route::put('/update-order', [OrderManagement::class, 'update']);
    Route::delete('/delete-order', [OrderManagement::class, 'delete']);
    Route::get('/get-all-order', [OrderManagement::class, 'getAll']);
    Route::get('/get-order/{keyword}', [OrderManagement:: class, 'getOrderbyId']);
    Route::get('/get-order-group-by-item/{keyword}',[OrderManagement::class, 'getAllOrderGroupByItem']);
    Route::get('/get-order-group-by-customer/{keyword}',[OrderManagement::class, 'getAllOrderGroupByCustomer']);
    Route::get('/get-order-by-customer/{keyword}', [OrderManagement:: class, 'getAllOrderGroupByCustomerId']);
    Route::post('/cut-off-order',[OrderManagement::class, 'cutOffOrder']);
    Route::get('/get-dhl-label-excel-file',[OrderManagement::class, 'DHLExportExcel']);
    Route::get('/get-kerry-label-excel-file',[OrderManagement::class, 'KerryExportExcel']);

});
Route::prefix('stock')->group(function(){
    Route::post('/new-stock',[StockManagement::class, 'create']);
    Route::put('/update-stock', [StockManagement::class, 'update']);
    Route::delete('/delete-stock', [StockManagement::class, 'delete']);
    Route::get('/get-all-stock', [StockManagement::class, 'getAll']);
    Route::get('/get-stock/{keyword}', [StockManagement::class, 'getStockById']);
    Route::get('/search-stock/{keyword}', [StockManagement:: class, 'searchStock']);
});
Route::prefix('item')->group(function(){
    Route::post('/new-item',[ItemManagement::class, 'create']);
    Route::put('/update-item', [ItemManagement::class, 'update']);
    Route::delete('/delete-item', [ItemManagement::class, 'delete']);
    Route::get('/get-all-item', [ItemManagement::class, 'getAll']);
    Route::post('/get-item/{keyword}', [ItemManagement::class, 'getItemById']);
    Route::get('/search-item/{keyword}', [ItemManagement:: class, 'searchItem']);
});
Route::prefix('address')->group(function(){
    Route::post('/new-address',[AddressManagement::class, 'createAddress']);
    Route::put('/update-address', [AddressManagement::class, 'updateAddress']);
    // Route::delete('/delete-item', [AddressManagement::class, 'delete']);
    Route::get('/get-all-province', [AddressManagement::class, 'getProvinces']);
    Route::get('/get-amphures/{keyword}', [AddressManagement::class, 'getAmphures']);
    Route::get('/get-tombons/{keyword}', [AddressManagement:: class, 'getTombons']);
    Route::get('/get-zipcode/{keyword}', [AddressManagement:: class, 'getZipcode']);
});
Route::prefix('history')->group(function(){
    Route::get('/get-history-by-customer-id/{keyword}',[HistoryManagement::class, 'getHistoryByCustomerId']);
    Route::get('/get-all-history-order/{keyword}',[HistoryManagement::class, 'getAllHistoryOrder']);
});
Route::prefix('promotion')->group(function(){
    Route::post('/new-promotion',[PromotionManagement::class, 'createPromotion']);
    Route::post('/update-promotion',[PromotionManagement::class, 'updatePromotion']);
    Route::get('/get-all-promotion',[PromotionManagement::class, 'getAllPromotion']);
    Route::get('/get-promotion-by-id/{keyword}',[PromotionManagement::class, 'getPromotionByIdPromotion']);
});
Route::prefix('analysis')->group(function(){
    Route::post('/get-data-analysis',[AnalysisManagement::class, 'getAnlysis']);
});