<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_orders', function (Blueprint $table) {
            $table->id('id_sub_order');
            $table->string('id_order');
            $table->string('id_item');
            $table->integer('number');
            $table->string('id_promotion')->nullable();
            $table->integer('extra_number')->nullable();
            $table->string('note')->nullable();
            $table->boolean('status_order');
            $table->integer('cost_order')->default(0);
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
        Schema::dropIfExists('sub_orders');
    }
}
