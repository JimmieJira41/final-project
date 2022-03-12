<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;

use App\Models\customer;

use App\Models\address;


class CustomerManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        if(!$request['firstname_customer']){
            return response("please enter firstname!");
        }
        if(!$request['lastname_customer']){
            return response("please enter lastname!");
        }
        if(!$request['default_id_address']){
            return response("please enter currently address!");
        }
        if(!$request['id_addresses']){
            return response("please enter another addresses!");
        }
        $customer_exist = customer::where('firstname_customer', $request['firstname_customer'])->first();
        if($customer_exist !== null){
            return response("This customer is already exist!", 400);
        }else{
        $customer = new customer();
        $customer->firstname_customer = $request['firstname_customer'];
        $customer->lastname_customer = $request['lastname_customer'];
        $customer->default_id_address = $request['default_id_address'];
        $customer->tel_customer = $request['tel_customer'];
        $customer->id_addresses = $request['id_addresses'];
        $customer->created_at = $time;
        $customer->updated_at = $time;
        if($customer->save()){
            $address = new address();
            $address->description_address = $request->description_address;
            $address->province_address = $request->province_address;
            $address->amphure_address = $request->amphure_address;
            $address->tombon_address = $request->tombon_address;
            $address->zipcode_address = $request->zipcode_address;
            $address->id_customer = $request->id_customer;
            if($address->save()){
                
            }
            // return $customer; 
            return response('create new customer success', 201);
        }else{
            return response('create new customer fail!', 417);
        }
        }
    }
    public function update(Request $request){
        $time = Carbon::now();
        if(!$request['id_customer']){
            return response("please enter ID customer!");
        }
    
        $customer = customer::find($request['id_customer']);
        if($customer){
            if($request['firstname_customer']){
                $customer->firstname_customer = $request->firstname_customer;
            }
            if($request['lastname_customer']){
                $customer->lastname_customer = $request->lastname_customer;
            }
            if($request['tel_customer']){
                $customer->tel_customer = $request->tel_customer;
            }
            if($request['default_id_address']){
                $customer->default_id_address = $request->default_id_address;
            }
            if($request['id_addresses']){
                $customer->id_addresses = $request->id_addresses;
            }
            $customer->updated_at = $time;
            
            if($customer->update()){
                // return response()->json($request);
                return response('update customer success!', 200); 
            }else{
                return response('update customer fail!', 417);
            }
        }else{
            return response('This customer is not found!', 400);
        }
        
    }
    public function delete(Request $request){
        if(customer::where('id_customer',$request['id_customer'])->delete()){
            return response("delete customer success!", 200);   
        }else{
            return response("delete customer fail!", 400);   
        }

    }
    public function getAll(){
        $customerList = customer::all();
        $customerListResponse = [];
        foreach($customerList as $customer){
            $address = address::where('id_address',$customer['default_id_address'])->get()->first();
            $customer->address = $address;
            array_push($customerListResponse, $customer);
        }
        return response()->json($customerListResponse);
    }
    public function getCustomerById(Request $request){
        $customer = customer::where('id_customer', $request->keyword)->get()->first();
        $address = address::where('id_address',$customer['default_id_address'])->get()->first();
        $customer->address = $address;
        return response()->json($customer);
    }
    public function searchCustomer(Request $request){
        $customer = customer::where("id_customer", "LIKE", "%". $request->keyword. "%")
        ->orWhere("firstname_customer", "LIKE", "%". $request->keyword. "%")
        ->orWhere("lastname_customer", "LIKE", "%". $request->keyword. "%")
        ->get()->first();
        if($customer){
            return response()->json($customer);
        }
    } 
}
