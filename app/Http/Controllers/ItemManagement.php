<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use App\Models\item;


class ItemManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        if(!$request['title_item']){
            return response("please enter title_item!");
        }
        if(!$request['description_item']){
            return response("please enter description_item!");
        }
        if(!$request['cost_item']){
            return response("please enter cost_item!");
        }
        if(!$request['id_stock']){
            return response("please enter id_stock!");
        }
        if(!$request['total_use']){
            return response("please enter total_use!");
        }
        $item_exist = item::where('id_stock', implode(",",$request['id_stock']))
        // $item_exist = item::where('id_stock', $request['id_stock'])
        ->where('total_use', $request['total_use'])
        ->first();
        if($item_exist != null){
            return response("This item is already exist!", 417);
        }else{
            $item = new item();
            $item->title_item = $request['title_item'];
            $item->description_item = $request['description_item'];
            $item->cost_item = $request['cost_item'];
            $stock_list = implode(",",$request['id_stock']);
            $item->id_stock = $stock_list;
            $item->total_use = $request['total_use'];
            $item->created_at = $time;
            $item->updated_at = $time;
            if($item->save()){
                return response("create item success!", 200);
            }else{
                return response("create item fail!", 500);
            }
        }
       
    }
    public function update(Request $request){
        if(!$request['id_item']){
            return response("please enter ID item!");
        }
        $item = item::find($request['id_item']);
        if($item){
            if($request['title_item']){
                $item->title_item = $request['title_item'];
            }
            if($request['description_item']){
                $item->description_item = $request['description_item'];
            }
            if($request['cost_item']){
                $item->cost_item = $request['cost_item'];
            }
            if($request['id_stock']){
                $stock_list = implode(",",$request['id_stock']);
                $item->id_stock = $stock_list;
            }
            if($request['total_use']){
                $item->total_use = $request['total_use'];
            }
            if($item->update()){
                return response("update item success!");
            }else{
                return response("update item fail!");
            }
        }else{
            return response("this item is not found!");
        }

    }
    public function delete(Request $request){
        if(item::where('id_item',$request['id_item'])->delete()){
            return response("delete item success!");
        }else{
            return response("delete item fail!");
        }
    }
    public function getAll(){
        return response()->json(item::all());
    }
    public function getItemById(Request $request){
        $item = item::where('id_item', $request->keyword)->get()->first();
        if($item){
            $item->id_stock = explode(",", $item->id_stock);
            return response()->json($item);
        }
    }
    public function searchItem(Request $request){
        $item = item::where("id_item", "LIKE", "%" .$request->keyword. "%")
        ->orWhere("title_item", "LIKE", "%" .$request->keyword. "%")
        ->orWhere("description_item", "LIKE", "%" .$request->keyword. "%")
        ->get();
        if($item){

           
            return response()->json($item);
        }
    } 
}
