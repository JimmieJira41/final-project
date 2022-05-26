<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class preStock extends Model
{
    use HasFactory;
    public $incrementing = false;
    protected $primaryKey = "id_pre_stock";
    protected $keyType = 'text';
    protected $fillable = [
        "id_promotion"
    ];
}
