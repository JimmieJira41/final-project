<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\order;

use Carbon\Carbon;

class OrderManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        $order = new order();
        $order->id_customer = $request['id_customer'];
        $order->id_address = $request['id_address'];
        $order->id_item = $request['id_item'];
        $order->number = $request['number'];
        $order->create_by = $request['create_by'];
        $order->created_at = $time;
        $order->updated_at = $time;
        if($order->save()){
            return response()->json($order); 
        }else{
            return response('create new order fail',404);
        }
    }
    public function update(Request $request){
        $order = order::find($request['id_order']);
        $time = Carbon::now();
        $order->id_customer = $request['id_customer'];
        $order->id_address = $request['id_address'];
        $order->id_item = $request['id_item'];
        $order->number = $request['number'];
        $order->updated_at = $time;
        
        if($order->update()){
            return response()->json($request); 
        }else{
            return response('create new order fail',404);
        }
    }
    public function delete(Request $request){
        $order = order::where('id_order',$request['id_order'])->delete();

    }
    public function getAll(){
        $order = order::all();
        return response()->json($order);
    }
    public function searchById(Request $request){
        $order = order::find($request['id_order']);
        return response()->json($order);
    } 
}
