<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subOrder extends Model
{
    use HasFactory;
    protected $primaryKey = "id_sub_order";
    protected $fillable = [
        "id_sub_order"
    ];
}
