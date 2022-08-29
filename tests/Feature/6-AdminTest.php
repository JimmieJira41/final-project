<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AdminTest extends TestCase
{
    public function test_case_create_new_admin()
    {
        $response = $this->post('/api/admin/login', [
            'email' => 'natdanai.jirakangwan@gmail.com',
            'password' => 'jimmie.Field28'
        ]);
        $token = $response->decodeResponseJson()['access_token'];
        $response = $this->withHeaders([
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token
        ])->post('/api/admin/new-admin', [
            "email" => "testtest@gmail.com",
            "password" => "test.Test1234",
            "password_confirmation" => "test.Test1234",
            "name" => "test test",
            "tel" => "000000000",
            "id_permission" => "1"
        ]);
        $response->assertStatus(201);
        // $response->assertDatabaseHas('users',[
        //     "email" => "testtest@gmail.com"
        // ]);
    }

    // public function test_case_create_new_admin_existing_system()
    // {

    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);

    //     $token = $response->decodeResponseJson()['access_token'];

    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post('/api/admin/new-admin', [
    //         "email" => "testtest@gmail.com",
    //         "password" => "test.Test1234",
    //         "password_confirmation" => "test.Test1234",
    //         "name" => "test test",
    //         "tel" => "000000000",
    //         "id_permission" => "1"
    //     ]);

    //     $response->assertStatus(422);
    // }

    public function test_case_edit_admin()
    {
        $response = $this->post('/api/admin/login', [
            'email' => 'natdanai.jirakangwan@gmail.com',
            'password' => 'jimmie.Field28'
        ]);
        $token = $response->decodeResponseJson()['access_token'];
        $response = $this->withHeaders([
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token
        ])->put('/api/admin/update-admin', [
            "id" => "11",
            "username_admin" => "testtest@gmail.com",
            "name_admin" => "test test",
            "tel_admin" => "000000000",
            "id_permission" => "1",
        ]);
        $response->assertStatus(200);
    }

    public function test_case_delete_admin()
    {
        $response = $this->post('/api/admin/login', [
            'email' => 'natdanai.jirakangwan@gmail.com',
            'password' => 'jimmie.Field28'
        ]);
        $token = $response->decodeResponseJson()['access_token'];
        $response = $this->withHeaders([
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token
        ])->delete('/api/admin/delete-admin', [
            "id_admin" => "11",
        ]);
        $response->assertStatus(200);
    }

    public function test_case_show_all_admin()
    {
        $response = $this->post('/api/admin/login', [
            'email' => 'natdanai.jirakangwan@gmail.com',
            'password' => 'jimmie.Field28'
        ]);
        $token = $response->decodeResponseJson()['access_token'];
        $response = $this->withHeaders([
            'Accept' => 'application/json',
            'Authorization' => 'Bearer ' . $token
        ])->get('/api/admin/get-all-admin');
        $response->assertStatus(200);
    }
}
