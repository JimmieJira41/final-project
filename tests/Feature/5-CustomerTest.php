<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class CustomerTest extends TestCase
{
    // public function test_case_create_new_customer()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->post('/api/customer/new-customer', [
    //         "firstname_customer" => "test",
    //         "lastname_customer" => "test",
    //         "facebook_contact_customer" => "test",
    //         "line_contact_customer" => "test",
    //         "tel_customer" => "0000000000",
    //         "default_id_address" => "",
    //         "id_addresses" => "",
    //         "description_address" => "000/00",
    //         "province_address" => "เชียงใหม่",
    //         "amphure_address" => "เมืองเชียงใหม่",
    //         "tombon_address" => "ท่าศาลา",
    //         "zipcode_address" => "50000",
    //     ]);
    //     $response->assertStatus(201);
    // }

    // // public function test_case_create_new_customer_existing_system()
    // // {

    // //     $response = $this->post('/api/admin/login', [
    // //         'email' => 'natdanai.jirakangwan@gmail.com',
    // //         'password' => 'jimmie.Field28'
    // //     ]);

    // //     $token = $response->decodeResponseJson()['access_token'];

    // //     $response = $this->withHeaders([
    // //         'Accept' => 'application/json',
    // //         'Authorization' => 'Bearer ' . $token
    // //     ])->post('/api/customer/new-customer', [
    // //         "firstname_customer" => "test",
    // //         "lastname_customer" => "test",
    // //         "facebook_contact_customer" => "test",
    // //         "line_contact_customer" => "test",
    // //         "tel_customer" => "0000000000",
    // //         "default_id_address" => "",
    // //         "id_addresses" => "",
    // //         "description_address" => "000/00",
    // //         "province_address" => "เชียงใหม่",
    // //         "amphure_address" => "เมืองเชียงใหม่",
    // //         "tombon_address" => "ท่าศาลา",
    // //         "zipcode_address" => "50000",
    // //     ]);

    // //     $response->assertStatus(400);
    // // }

    // public function test_case_edit_customer()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->put('/api/customer/update-customer', [
    //         "id_customer" => "9",
    //         "firstname_customer" => "test",
    //         "lastname_customer" => "test",
    //         "tel_customer" => "0000000000",
    //         "default_id_address" => "9",
    //         "id_address" => "9",
    //         "description_address" => "000/00",
    //         "province_address" => "เชียงใหม่",
    //         "amphure_address" => "เมืองเชียงใหม่",
    //         "tombon_address" => "ท่าศาลา",
    //         "zipcode_address" => "50000"
    //     ]);
    //     $response->assertStatus(200);
    // }

    // public function test_case_delete_customer()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->delete('/api/customer/delete-customer', [
    //         "id_customer" => "9",
    //     ]);
    //     $response->assertStatus(200);
    // }

    // public function test_case_show_all_customer()
    // {
    //     $response = $this->post('/api/admin/login', [
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);
    //     $token = $response->decodeResponseJson()['access_token'];
    //     $response = $this->withHeaders([
    //         'Accept' => 'application/json',
    //         'Authorization' => 'Bearer ' . $token
    //     ])->get('/api/customer/get-all-customer');
    //     $response->assertStatus(200);
    // }


}
