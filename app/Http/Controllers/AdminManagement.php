<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\admin;

use Carbon\Carbon;

class AdminManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        $admin = new admin();
        $admin->username_admin = $request['username_admin'];
        $admin->password_admin = $request['password_admin'];
        $admin->name_admin = $request['name_admin'];
        $admin->tel_admin = $request['tel_admin'];
        $admin->image_profile_admin = $request['image_profile_admin'];
        $admin->id_permission = $request['id_permission'];
        $admin->created_at = $time;
        $admin->updated_at = $time;
        if($admin->save()){
            return response()->json($admin);
        }else{
            return response("update admine successfully");
        }
    }
    public function update(Request $request){
        $time = Carbon::now();
        $admin = admin::find($request['id_admin']);
        $admin->username_admin = $request['username_admin'];
        $admin->password_admin = $request['password_admin'];
        $admin->name_admin = $request['name_admin'];
        $admin->tel_admin = $request['tel_admin'];
        $admin->image_profile_admin = $request['image_profile_admin'];
        $admin->id_permission = $request['id_permission'];
        $admin->updated_at = $time;
        if($admin->update()){
            return response()->json($admin);
        }else{
            return response("update admine successfully");
        }
    }
    public function delete(Request $request){
        admin::where('id_admin',$request['id_admin'])->delete();
    }
    public function getAll(){
        $admin = admin::all();
        return response()->json($admin);
    }
    public function searchById(Request $request){
        $admin = admin::find($request['id_admin']);
        return response()->json($admin);
    } 
}
