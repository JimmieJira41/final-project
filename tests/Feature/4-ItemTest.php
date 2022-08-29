<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ItemTest extends TestCase
{
    // public function test_case_create_new_item()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $title = "functional-testing";
    //     $description = "data-testing";
    //     $cost = "1";
    //     $stock = [4];
    //     $total = "99";
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post(
    //         '/api/item/new-item',
    //         [
    //             "title_item" =>  $title,
    //             "description_item" => $description,
    //             "cost_item" => $cost,
    //             "id_stock" => $stock,
    //             "total_use" => $total
    //         ]
    //     );
    //     $response->assertStatus(200);
    // }

    // public function test_case_create_new_item_existing_system()
    // {

    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);

    //     $token = $response->decodeResponseJson()['access_token'];

    //     $title = "functional-testing";
    //     $description = "data-testing";
    //     $cost = "1";
    //     $stock = [4];
    //     $total = "99";

    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post(
    //         '/api/item/new-item',
    //         [
    //             "title_item" =>  $title,
    //             "description_item" => $description,
    //             "cost_item" => $cost,
    //             "id_stock" => $stock,
    //             "total_use" => $total
    //         ]
    //     );

    //     $response->assertStatus(417);
    // }

    // public function test_case_edit_item()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $id_item = '44';
    //     $title = "edit-functional-testing";
    //     $description = "edit-data-testing";
    //     $cost = "1";
    //     $stock = [4];
    //     $total = "99";
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->put(
    //         '/api/item/update-item',
    //         [
    //             "id_item" => $id_item,
    //             "title_item" =>  $title,
    //             "description_item" => $description,
    //             "cost_item" => $cost,
    //             "id_stock" => $stock,
    //             "total_use" => $total
    //         ]
    //     );
    //     $response->assertStatus(200);
    // }

    // public function test_case_delete_item()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $id_item = "44";
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->delete(
    //         '/api/item/delete-item',
    //         [
    //             "id_item" => $id_item
    //         ]
    //     );
    //     $response->assertStatus(200);
    // }

    // public function test_case_show_all_item()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/item/get-all-item');
    //     $response->assertStatus(200);
    // }

}
