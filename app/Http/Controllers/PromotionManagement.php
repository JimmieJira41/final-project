<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

use Carbon\Carbon;

use App\Models\promotion;
use App\Models\response;

class PromotionManagement extends Controller

{
    public function createPromotion(Request $request)
    {
        $alert = new response();
        $time = Carbon::now();
        if(!$request['title_promotion']){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'กรุณากรอกชื่อโปรโมชั่น';
            $alert->status = '401';
            return response()->json($alert);
        }
        if(!$request['number_promotion']){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'กรุณากรอกจำนวนสินคาที่ใช้';
            $alert->status = '401';
            return response()->json($alert);
        }
        $promotion = new promotion();
        $promotion->id_promotion = Str::random(9);
        $promotion->title_promotion = $request['title_promotion'];
        $promotion->number_promotion = $request['number_promotion'];
        $promotion->created_at = $time;
        $promotion->updated_at = $time;
        if($promotion->save()){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'สร้างโปรโมชั่นสำเร็จ';
            $alert->status = '200';
            return response()->json($alert);
        }
    }
    public function updatePromotion(Request $request){
        $alert = new response();
        $time = Carbon::now();
        if(!$request['id_promotion']){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'ไม่พบข้อมูลโปรโมชั่นนี้';
            $alert->status = '401';
            return response()->json($alert);
        }
        if(!$request['title_promotion']){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'กรุณากรอกชื่อโปรโมชั่น';
            $alert->status = '401';
            return response()->json($alert);
        }
        if(!$request['number_promotion']){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'กรุณากรอกจำนวนสินคาที่ใช้';
            $alert->status = '401';
            return response()->json($alert);
        }
        $promotion = promotion::where('id_promotion', $request['id_promotion'])->get()->first();
        // $promotion->id_promotion = $request['id_promotion'];
        $promotion->title_promotion = $request['title_promotion'];
        $promotion->number_promotion = $request['number_promotion'];
        $promotion->updated_at = $time;
        if($promotion->update()){
            // $alert->code = 'new.promotion.success';
            $alert->message = 'อัพเดรตโปรโมชั่นสำเร็จ';
            $alert->status = '200';
            return response()->json($alert);
        }
    }
    public function deletePromotion(Request $request){
        return promotion::where('id_promotion',$request->keyword)->delete();
    }
    public function getAllPromotion(){
        return promotion::all();
    }
    public function getPromotionByIdPromotion(Request $request){
        $alert = new response();
        $promotion = promotion::where('id_promotion', $request->keyword)->get()->first();
        if($promotion){
            return $promotion;
        }else{
            $alert->message = 'ไม่พบข้อมูลโปนโมชั่นนี้';
            $alert->status = '401';
        }
    }
}
