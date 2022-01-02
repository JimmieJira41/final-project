<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use App\Models\stock;

class StockManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        $stock = new stock();
        $stock->id_stock = $request['id_stock'];
        $stock->title_stock = $request['title_stock'];
        $stock->description_stock = $request['description_stock'];
        $stock->total_stock = $request['total_stock'];
        $stock->created_at = $time;
        $stock->updated_at = $time;
        if($stock->save()){
            return response()->json($stock);
        }else{
            return response("update stock successfully");
        }
    }
    public function update(Request $request){
        $time = Carbon::now();
        $stock = stock::find($request['id_stock']);
        $stock->id_stock = $request['id_stock'];
        $stock->title_stock = $request['title_stock'];
        $stock->description_stock = $request['description_stock'];
        $stock->total_stock = $request['total_stock'];
        $stock->updated_at = $time;
        if($stock->update()){
            return response()->json($stock);
        }else{
            return response("update stock successfully");
        }
    }
    public function delete(Request $request){
        stock::where('id_stock',$request['id_stock'])->delete();
    }
    public function getAll(){
        $stock = stock::all();
        return response()->json($stock);
    }
    public function searchById(Request $request){
        $stock = stock::find($request['id_stock']);
        return response()->json($stock);
    } 
}
