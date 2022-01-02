<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use App\Models\item;


class ItemManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        $item = new item();
        $item->title_item = $request['title_item'];
        $item->description_item = $request['description_item'];
        $item->id_stock = $request['id_stock'];
        $item->total_use = $request['total_use'];
        $item->created_at = $time;
        $item->updated_at = $time;
        if($item->save()){
            return response()->json($item);
        }else{
            return response("update item successfully");
        }
    }
    public function update(Request $request){
        $item = item::find($request['id_item']);
        $item->title_item = $request['title_item'];
        $item->description_item = $request['description_item'];
        $item->id_stock = $request['id_stock'];
        $item->total_use = $request['total_use'];
        if($item->update()){
            return response()->json($item);
        }else{
            return response("update item successfully");
        }
    }
    public function delete(Request $request){
        item::where('id_item',$request['id_item'])->delete();
    }
    public function getAll(){
        $item = item::all();
        return response()->json($item);
    }
    public function searchById(Request $request){
        $item = item::find($request['id_item']);
        return response()->json($item);
    } 
}
