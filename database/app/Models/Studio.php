<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Studio extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "studios";

    protected $primaryKey = "id";

    protected $fillable = [
        'jenis',
        'jumlahKursi',
        'harga',
    ];

    public function pemesananTiket(){
        return $this->hasMany(PemesananTiket::class);
    }

    public function jadwal(){
        return $this->hasMany(Jadwal::class);
    }
}
