<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tour_objects', function (Blueprint $table) {
            $table->id();

            $table->foreignId('tour_type_id')->constrained();
            $table->foreignId('province_id');
            $table->text('description');
            $table->text('location');


            $table->string('name');
            $table->string('distance');
            $table->string('avg_price');
            $table->string('rating');
            $table->string('review');


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tour_objects');
    }
};
