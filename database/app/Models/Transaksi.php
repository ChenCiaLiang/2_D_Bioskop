<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{

    public $timestamps = false;

    protected $table = "transaksis";

    protected $primaryKey = "id";

    protected $fillable = [
        'idPelanggan',
        'idPemesananTiket',
        'metodePembayaran',
        'totalHarga',
        'kursiDipesan',
    ];

    public function users(){
        return $this->belongsTo(User::class);
    }

    public function pemesananTiket(){
        return $this->belongsTo(PemesananTiket::class);
    }
    
    public function history(){
        return $this->hasOne(History::class);
    }

}
