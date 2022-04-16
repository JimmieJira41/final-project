<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class promotion extends Model
{
    use HasFactory;
    public $incrementing = false;
    protected $primaryKey = "id_promotion";
    protected $keyType = 'text';
    protected $fillable = [
        "id_promotion"
    ];
}
