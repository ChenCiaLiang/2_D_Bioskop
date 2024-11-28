<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jadwal extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "jadwals";

    protected $primaryKey = "id";

    protected $fillable = [
        'idStudio',
        'tanggalTayang',
        'jamTayang',
    ];

    public function studio(){
        return $this->belongsTo(Studio::class);
    }
}
