<?php

namespace App\Http\Controllers;

use App\Models\address;

use App\Models\amphures;

use App\Models\tombons;

use App\Models\provinces;

use Illuminate\Http\Request;

class AddressManagement extends Controller
{
    public function createAddress(Request $request){
        $address = new address();
        $address->id_customer = $request['id_customer'];
        $address->description_address = $request['description_address'];
        $address->tombon_address = $request['tombon_address'];
        $address->amphure_address = $request['amphure_address'];
        $address->province_address = $request['province_address'];
        $address->save();
    }
    
    public function updateAddress(Request $request){
        $address = new address();
        $address->id_address = $request['id_address'];
        $address->id_customer = $request['id_customer'];
        $address->description_address = $request['description_address'];
        $address->tombon_address = $request['tombon_address'];
        $address->amphure_address = $request['amphure_address'];
        $address->province_address = $request['province_address'];
        $address->update();
    }

    public function getAddressById(Request $request){
        // $adddress_body = new address();
        $address = address::where('id_address',$request['id_address'])->get()->first();
        // $tombon = tombons::where('id',$address->tombon_address)->get()->first();
        // $amphure = amphures::where('id',$address->amphure_address)->get()->first();
        // $tombon = tombons::where('id',$address->tombon_address)->get()->first();
        return response()->json($address);
    }

    public function getProvinces(){
        $provinceList = provinces::all();
        return response()->json($provinceList);
    }

    public function getAmphures(Request $request){
        $amphureList = amphures::where('province_id',$request['id_province'])->get()->first();
        return response()->json($amphureList);
    }

    public function getTombons(Request $request){
        $tombonList = tombons::where('amphure_id',$request['id_amphure'])->get()->first();
        return response()->json($tombonList);
    }
}
