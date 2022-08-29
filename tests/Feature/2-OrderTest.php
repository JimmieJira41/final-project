<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class OrderTest extends TestCase
{
    protected $id_order_current = '';
    protected $id_order_next = '';


    // public function test_case_create_new_order()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/order/prepare-order');
    //     $this->id_order_current = $response->decodeResponseJson()['id_order'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post('/api/order/new-order', [
    //         "id_order" => $this->id_order_current,
    //         "id_customer" => 2,
    //         "name_customer" => "test test",
    //         "id_address" => "2",
    //         "items" => [
    //             [
    //                 "id_item" => 4,
    //                 "title_item" => "ส้มคละเบอร์ 5-6-7 x 10 กก.",
    //                 "description_item" => "ส้มคละเบอร์ 5-6-7 / 10 กิโลกรัม",
    //                 "cost_item" => "699",
    //                 "id_stock" => "9,10,11",
    //                 "total_use" => "10",
    //                 "created_at" => "2022-05-27T16:22:22.000000Z",
    //                 "updated_at" => "2022-07-24T02:15:32.000000Z",
    //                 "isSeleted" => false,
    //                 "id_promotion" => "",
    //                 "number_promotion" => "",
    //                 "extra_number" => "",
    //                 "number" => 1,
    //                 "total_cost" => 699,
    //             ],
    //         ],
    //         "create_by" => "natdanai.jirakangwan@gmail.com",
    //         "delivery_date" => "08-27-2022",
    //         "status_order" => false,
    //         "status_payment" => false,
    //     ]);
    //     $response->assertStatus(200);
    // }

    // public function test_case_create_new_order_next_delivery_date()

    // {

    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);

    //     $token = $response->decodeResponseJson()['access_token'];

    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/order/prepare-order');

    //     $this->id_order_next = $response->decodeResponseJson()['id_order'];

    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post('/api/order/new-order', [
    //         "id_order" => $this->id_order_next,
    //         "id_customer" => 2,
    //         "name_customer" => "ชนนิกานต์ วรรณวงศ์",
    //         "id_address" => "2",
    //         "items" => [
    //             [
    //                 "id_item" => 4,
    //                 "title_item" => "ส้มคละเบอร์ 5-6-7 x 10 กก.",
    //                 "description_item" => "ส้มคละเบอร์ 5-6-7 / 10 กิโลกรัม",
    //                 "cost_item" => "699",
    //                 "id_stock" => "9,10,11",
    //                 "total_use" => "10",
    //                 "created_at" => "2022-05-27T16:22:22.000000Z",
    //                 "updated_at" => "2022-07-24T02:15:32.000000Z",
    //                 "isSeleted" => false,
    //                 "id_promotion" => "",
    //                 "number_promotion" => "",
    //                 "extra_number" => "",
    //                 "number" => 1,
    //                 "total_cost" => 699,
    //             ],
    //         ],
    //         "create_by" => "natdanai.jirakangwan@gmail.com",
    //         "delivery_date" => "08-27-2022",
    //         "status_order" => false,
    //         "status_payment" => false,
    //     ]);

    //     $response->assertStatus(200);
        
    // }

    // public function test_case_edit_order()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->put('/api/order/update-order', [
    //         "id_order" => "KW00006",
    //         "id_customer" => 2,
    //         "name_customer" => "ชนนิกานต์ วรรณวงศ์",
    //         "id_address" => 1,
    //         "subOrders" => [
    //             [
    //                 "id_item" => "4",
    //                 "number" => "1",
    //                 "id_promotion" => "",
    //                 "extra_number" => "",
    //                 "note" => "",
    //                 "title_item" => "ส้มคละเบอร์ 5-6-7 x 10 กก.",
    //                 "description_item" => "ส้มคละเบอร์ 5-6-7 / 10 กิโลกรัม",
    //                 "cost_item" => "699",
    //                 "total_cost" => 699,
    //             ],
    //         ],
    //         "create_by" => "jimmie",
    //         "status_order" => false,
    //         "status_payment" => false,
    //         "delivery_date" => "08-27-2022",
    //     ]);
    //     $response->assertStatus(200);
    // }


    // public function test_case_delete_order()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->delete('/api/order/delete-order/', [
    //         "delivery_date" => "08-27-2022", 
    //         "id_order" =>  "KW00006"
    //     ]);
    //     $response->assertStatus(200);
    // }

    // show all order group by item

    // public function test_case_show_all_order_group_by_item()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $delivery_date = '8-26-2022';
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/order/get-order-group-by-item/' . $delivery_date);
    //     $response->assertStatus(200);
    // }

    // show all order group by customer

    // public function test_case_show_all_order_group_by_customer()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $delivery_date = '8-26-2022';
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/order/get-order-group-by-customer/' . $delivery_date);
    //     $response->assertStatus(200);
    // }

    // show all order group by history

    // public function test_case_show_all_order_group_by_history()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $delivery_date = '8-26-2022';
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/history/get-all-history-order/' . $delivery_date);
    //     $response->assertStatus(200);
    // }

}
