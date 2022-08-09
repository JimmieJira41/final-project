<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->string('id_order');
            $table->string('id_sub_order');
            $table->string('name_customer');
            $table->string('id_customer');
            $table->string('id_address');
            $table->boolean('status_order')->default(false);
            $table->boolean('status_validate_payment')->default(false);
            $table->boolean('status_payment')->default(false);
            $table->double('total_cost_order')->default(0);
            $table->date('delivery_date')->useCurrent();
            $table->string('create_by');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent();
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
