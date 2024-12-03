<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PemesananTiket extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "pemesananTikets";

    protected $primaryKey = "id";

    protected $fillable = [
        'idJadwalTayang',
        'idFilm',
    ];

    public function film(){
        return $this->belongsTo(Film::class);
    }

    public function jadwalTayang(){
        return $this->belongsTo(JadwalTayang::class);
    }
}
