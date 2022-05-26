<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use App\Models\stock;
use App\Models\preStock;
use App\Models\history_stock;


class StockManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        if(!$request['title_stock']){
            return response("please enter title_stock!");
        }
        if(!$request['description_stock']){
            return response("please enter description_stock!");
        }
        if(!$request['total_stock']){
            return response("please enter total_stock!");
        }
      
        $stock_exist = stock::where('title_stock', $request['title_stock'])
        ->where('total_stock', $request['total_stock'])
        ->first();
        if($stock_exist !== null){
            return response("This stock is already exist!", 400);
        }else{
            $stock = new stock();
            $stock->title_stock = $request['title_stock'];
            $stock->description_stock = $request['description_stock'];
            $stock->total_stock = $request['total_stock'];
            $stock->created_at = $time;
            $stock->updated_at = $time;
            if($stock->save()){
                return response("update stock success", 201);
            }else{
                return response("update stock fail", 417);
            }
        }
    }
    public function update(Request $request){
        $time = Carbon::now();
        if(!$request['id_stock']){
            return response("please enter id_stock!");
        }
        $stock = stock::find($request['id_stock']);
        if($stock){
            if($request['title_stock']){
                $stock->title_stock = $request['title_stock'];
            }
            if($request['description_stock']){
                $stock->description_stock = $request['description_stock'];
            }
            if($request['total_stock']){
                $stock->total_stock = $request['total_stock'];
            }
    
            $stock->updated_at = $time;

            $history_stock = new history_stock();
            $history_stock->number = $stock->total_stock;
            $history_stock->update_by = "jimmie";
            $history_stock->created_at = $time;
            $history_stock->updated_at = $time;     
            
            if($stock->update()){
                $history_stock->id_stock = $stock->id_stock;
                $history_stock->save();
                return response("update stock successful!", 200);
            }else{
                return response("update stock fail!", 417);
            }
        }else{
            return response("This stock is not found!", 400);
        }
    }
       
    public function delete(Request $request){
        if(stock::where('id_stock',$request['id_stock'])->delete()){
            return response("delete stock success!", 200);   
        }else{
            return response("delete stock fail!", 400);
        }
    }
    public function getAll(){
        return response()->json(stock::all());
    }
    public function getPreStock(){
        $preStockList = preStock::all();
        foreach($preStockList as $preStock){
            $stock = stock::where('id_stock', $preStock->id_stock)->get('title_stock')->first();
            $preStock->title_stock = $stock->title_stock;
        }
        return response()->json($preStockList);
    }
    
    public function getStockById(Request $request){
        $stock = stock::where('id_stock', $request->keyword)->get();
        if($stock){
            return response()->json($stock);
        }
    }
    public function searchStock(Request $request){
        $stock = stock::where("id_stock", "LIKE", "%" .$request->keyword. "%")
        ->orWhere("title_stock", "LIKE", "%" .$request->keyword. "%")
        ->get();
        if($stock){
            return response()->json($stock);
        }
    } 
    public function getHistoryStock(){
        $history_stock = history_stock::all()->sortByDesc("updated_at");
        foreach($history_stock as $history){
            $stock = stock::where('id_stock', $history->id_stock)->get()->first();
            $history->title_stock = $stock->title_stock;
        }
        return response()->json($history_stock);
    }
}
