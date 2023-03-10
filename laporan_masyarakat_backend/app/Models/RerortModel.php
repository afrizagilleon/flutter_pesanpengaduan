<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RerortModel extends Model
{
    use HasFactory;
    protected $table = 'report';
    protected $guarded = [];
    public $timestamps = false;
    protected $primaryKey = 'id_user';
}
