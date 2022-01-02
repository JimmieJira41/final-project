<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use App\Models\customer;

class CustomerManagement extends Controller
{
    public function create(Request $request){
        $dataCustomer = $request;
        $time = Carbon::now();
        $customer = new customer();
        $customer->firstname_customer = $request['firstname_customer'];
        $customer->lastname_customer = $request['lastname_customer'];
        $customer->default_id_address = $dataCustomer['default_id_address'];
        $customer->id_addresses = $request['id_addresses'];
        $customer->created_at = $time;
        $customer->updated_at = $time;
        if($customer->save()){
            return response()->json($dataCustomer); 
        }else{
            return response('create new customer fail',404);
        }
    }
    public function update(Request $request){
        $customer = customer::find($request['id_order']);
        $time = Carbon::now();
        $customer->firstname_customer = $request->firstname_customer;
        $customer->lastname_customer = $request->lastname_customer;
        $customer->default_id_address = $request->default_id_address;
        $customer->id_addresses = $request->id_addresses;
        $customer->updated_at = $time;
        
        if($customer->update()){
            return response()->json($request); 
        }else{
            return response('create new customer fail',404);
        }
    }
    public function delete(Request $request){
        $customer = customer::where('id_customer',$request['id_order'])->delete();

    }
    public function getAll(){
        $customer = customer::all();
        return response()->json($customer);
    }
    public function searchById(Request $request){
        $customer = customer::find($request['id_order']);
        return response()->json($customer);
    } 
}
