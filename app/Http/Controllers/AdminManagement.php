<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\admin;

use Carbon\Carbon;

class AdminManagement extends Controller
{
    public function create(Request $request){
        $time = Carbon::now();
        if(!$request['username_admin']){
            return response("please enter username!");
        }
        if(!$request['password_admin']){
            return response("please enter password!");
        }
        if(!$request['name_admin']){
            return response("please enter name!");
        }
        if(!$request['tel_admin']){
            return response("please enter telephone number!");
        }
        if(!$request['id_permission']){
            return response("please enter permission!");
        }
        $admin_exist = admin::where('username_admin', $request['username_admin'])->first();
        
        if($admin_exist !== null){
            return response("this username is already exist!", 400);
        }else{
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
                return response("create new admin success!", 201);
            }else{
                return response("create new admin fail!", 417);
            }
        }
    }
    public function update(Request $request){
        $time = Carbon::now();
        if(!$request['id_admin']){
            return response("please enter ID admin!");
        }
    
        $admin = admin::find($request['id_admin']);
        if($admin){
            if($request['username_admin']){
                $admin->username_admin = $request['username_admin'];
            }
            if($request['password_admin']){
                $admin->password_admin = $request['password_admin'];
            }
            if($request['name_admin']){
                $admin->name_admin = $request['name_admin'];
            }
            if($request['tel_admin']){
                $admin->tel_admin = $request['tel_admin'];
            }
            if($request['id_permission']){
                $admin->id_permission = $request['id_permission'];
            }
            if($request['image_profile_admin']){
                $admin->image_profile_admin = $request['image_profile_admin'];
            }
            $admin->updated_at = $time;
            
            if($admin->update()){
                return response("update admin success!", 200);
            }else{
                return response("update admin fail!", 417);
            }
        }else{
            return response("this username not found!", 400);
        }
       
    }
    public function delete(Request $request){
        if(admin::where('id_admin',$request['id_admin'])->delete()){
            return response("delete admin success!", 200);
        }else{
            return response("delete admin fail!", 400);
        }
    }
    public function getAll(){
        return response()->json(admin::all());
    }
    public function getAdminById(Request $request){
        $admin = admin::where('id_admin', $request->keyword)->get()->first();
        return response()->json($admin);
    }
    public function searchAdmin(Request $request){
        $admin = admin::where("id_admin", "LIKE", "%" .$request['id_admin']. "%")
        ->orWhere("username_admin", "LIKE", "%" .$request['username_admin']. "%")
        ->orWhere("name_admin", "LIKE", "%" .$request['name_admin']. "%")
        ->orWhere("tel_admin", "LIKE", "%" .$request['tel_admin']. "%")
        ->get();
        return response()->json($admin);
    } 
}
