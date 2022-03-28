<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('histories', function (Blueprint $table) {
            $table->id('id_history');
            $table->string('id_order');
            $table->string('id_customer');
            $table->string('id_address');
            $table->string('id_item');
            $table->integer('number');
            $table->integer('cost_order')->default(0);
            $table->string('create_by');
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
        Schema::dropIfExists('histories');
    }
}
