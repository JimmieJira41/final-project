<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id('id_customer');
            $table->string('firstname_customer');
            $table->string('lastname_customer');
            $table->string('tel_customer');
            $table->text('line_contact_customer')->nullable();
            $table->text('facebook_contact_customer')->nullable();
            $table->string('default_id_address')->nullable();
            $table->string('id_addresses')->nullable();
            $table->date('created_at')->useCurrent();
            $table->date('updated_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}
