<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JadwalTayang extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "jadwalTayangs";

    protected $primaryKey = "id";

    protected $fillable = [
        'idStudio',
        'idJadwal',
    ];

    public function studio(){
        return $this->belongsTo(Studio::class);
    }

    public function jadwal(){
        return $this->belongsTo(Jadwal::class);
    }

    public function pemesananTiket(){
        return $this->hasMany(PemesananTiket::class);
    }

}
