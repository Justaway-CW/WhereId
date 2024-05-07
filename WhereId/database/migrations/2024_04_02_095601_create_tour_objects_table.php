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
            $table->foreignId('province_id')->constrained();
            $table->text('description')->nullable();
            $table->text('location')->nullable();
            $table->string('image')->nullable();
            $table->string('note')->nullable();


            $table->string('name');
            $table->unsignedFloat('distance');
            $table->unsignedInteger('price');
            $table->unsignedFloat('rating');
            $table->unsignedInteger('review');


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
