<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class LoginTest extends TestCase
{

    // login by user existing in system is pass (200)

    // public function test_case_login_pass()
    // {
    //     $response = $this->post('/api/admin/login',[
    //         'email' => 'natdanai.jirakangwan@gmail.com',
    //         'password' => 'jimmie.Field28'
    //     ]);

    //     $response->assertStatus(200);
    // }

    // login by user isn't existing in system is fail (417)

    // public function test_case_login_fail()
    // {
    //     $response = $this->post('/api/admin/login',[
    //         'email' => 'unknown@gmail.com',
    //         'password' => 'unknown'
    //     ]);

    //     $response->assertStatus(417);
    // }
    
}
