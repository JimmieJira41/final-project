<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class StoreTest extends TestCase
{

    // public function test_case_create_new_store()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $title = "functional-testing";
    //     $description = "data-testing";
    //     $total = "99";
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post('/api/stock/new-stock',[
    //         "title_stock" => $title,
    //         "description_stock" => $description,
    //         "total_stock" => $total,
    //         ]
    //     );
    //     $response->assertStatus(201);
    // }

    // // public function test_case_create_store_existing_system()
    // // {

    // //     $response = $this->post('/api/admin/login', [
    // //         'email' => 'natdanai.jirakangwan@gmail.com',
    // //         'password' => 'jimmie.Field28'
    // //     ]);

    // //     $token = $response->decodeResponseJson()['access_token'];
        
    // //     $title = "functional-testing";
    // //     $description = "data-testing";
    // //     $total = "99";

    // //     $response = $this->withHeaders([
    // //         'Accept' => 'application/json',
    // //         'Authorization' => 'Bearer ' . $token
    // //     ])->post('/api/stock/new-stock',[
    // //         "title_stock" => $title,
    // //         "description_stock" => $description,
    // //         "total_stock" => $total,
    // //         ]
    // //     );

    // //     $response->assertStatus(400);
    // // }

    // public function test_case_edit_store()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $id_store = "26";
    //     $title = "edit-functional-testing";
    //     $description = "edit-data-testing";
    //     $total = "99";
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->put('/api/stock/update-stock',[
    //         "id_stock" => $id_store,
    //         "title_stock" => $title,
    //         "description_stock" => $description,
    //         "total_stock" => $total,
    //         ]
    //     );
    //     $response->assertStatus(200);
    // }

    // public function test_case_delete_store()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $id_store = "26";
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->delete('/api/stock/delete-stock',[
    //         "id_stock" => $id_store
    //         ]
    //     );
    //     $response->assertStatus(200);
    // }

    // public function test_case_show_all_store()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/stock/get-all-stock');
    //     $response->assertStatus(200);
    // }

    // public function test_case_show_all_pre_store()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/stock/get-pre-stock');
    //     $response->assertStatus(200);
    // }
}

