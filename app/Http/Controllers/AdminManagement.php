<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Password;
use App\Models\User as user;
use Illuminate\Support\Facades\Auth;

use Carbon\Carbon;


class AdminManagement extends Controller
{

    public function login(Request $request)
    {
        $request->validate([
            'email' => '',
            'password' => '',
        ]);
        if (!Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            return response()->json(["message" => "login fail!"], 417);
        }
        $user = $request->user();

        $user->tokens()->delete();

        if ($user->id_permission == '1') {
            $token = $user->createToken('token-name', ['super-admin']);
        } else {
            $token = $user->createToken('token-name', ['admin']);
        }

        return response()->json([
            'user' => $user,
            'access_token' => $token->plainTextToken,
            'token_type' => 'Bearer',
            'abilities' => $token->accessToken->abilities
        ], 200);
    }

    public function logout(Request $request)
    {
        if ($request->user()->tokens()->delete()) {
            return response()->json([
                'message' => 'logout successfully'
            ], 200);
        } else {
            return response()->json([
                "message" => "logout fail!"
            ], 500);
        }
    }

    public function create(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:150',
            'email' => 'required|string|max:191|email|unique:users',
            'password' => [
                'required',
                'confirmed',
                Password::min(8)
                    ->letters()
                    ->mixedCase()
                    ->numbers()
                    ->symbols()
                    ->uncompromised()
            ],
        ]);
        echo "pass new user";
        $admin = new user();
        $admin->email = $request['email'];
        $admin->password = bcrypt($request['password']);
        $admin->name = $request['name'];
        $admin->tel = $request['tel'];
        $admin->image_profile = $request['image_profile'];
        $admin->id_permission = $request['id_permission'];
        if ($admin->save()) {
            return response()->json(["message" => "create new user success!"], 201);
        } else {
            return response()->json(["message" => "create new user fail!"], 500);
        }
        //     $time = Carbon::now();
        //     if (!$request['username']) {
        //         return response("please enter username!");
        //     }
        //     if (!$request['password']) {
        //         return response("please enter password!");
        //     }
        //     if (!$request['name']) {
        //         return response("please enter name!");
        //     }
        //     if (!$request['tel']) {
        //         return response("please enter telephone number!");
        //     }
        //     if (!$request['id_permission']) {
        //         return response("please enter permission!");
        //     }
        //     $admin_exist = user::where('username', $request['username'])->first();

        //     if ($admin_exist !== null) {
        //         return response("this username is already exist!", 400);
        //     } else {
        //         $admin = new user();
        //         $admin->username = $request['username'];
        //         $admin->password = $request['password'];
        //         $admin->name = $request['name'];
        //         $admin->tel = $request['tel'];
        //         $admin->image_profile = $request['image_profile'];
        //         $admin->id_permission = $request['id_permission'];
        //         $admin->created_at = $time;
        //         $admin->updated_at = $time;
        //         if ($admin->save()) {
        //             return response("create new user success!", 201);
        //         } else {
        //             return response("create new user fail!", 417);
        //         }
        //     }
    }
    public function update(Request $request)
    {
        $time = Carbon::now();
        if (!$request['id']) {
            return response("please enter ID admin!");
        }

        $admin = user::find($request['id']);
        if ($admin) {
            if ($request['username']) {
                $admin->username = $request['username'];
            }
            if ($request['password']) {
                $admin->password = $request['password'];
            }
            if ($request['name']) {
                $admin->name = $request['name'];
            }
            if ($request['tel']) {
                $admin->tel = $request['tel'];
            }
            if ($request['id_permission']) {
                $admin->id_permission = $request['id_permission'];
            }
            if ($request['image_profile']) {
                $admin->image_profile = $request['image_profile'];
            }
            $admin->updated_at = $time;

            if ($admin->update()) {
                return response("update admin success!", 200);
            } else {
                return response("update admin fail!", 417);
            }
        } else {
            return response("this username not found!", 400);
        }
    }
    public function delete(Request $request)
    {
        if (user::where('id', $request['id'])->delete()) {
            return response("delete admin success!", 200);
        } else {
            return response("delete admin fail!", 400);
        }
    }
    public function getAll()
    {
        return response()->json(user::all());
    }
    public function getAdminById(Request $request)
    {
        $admin = user::where('id', $request->keyword)->get()->first();
        return response()->json($admin);
    }
    public function searchAdmin(Request $request)
    {
        $admin = user::where("id", "LIKE", "%" . $request['id'] . "%")
            ->orWhere("username", "LIKE", "%" . $request['username'] . "%")
            ->orWhere("name", "LIKE", "%" . $request['name'] . "%")
            ->orWhere("tel", "LIKE", "%" . $request['tel'] . "%")
            ->get();
        return response()->json($admin);
    }
}
