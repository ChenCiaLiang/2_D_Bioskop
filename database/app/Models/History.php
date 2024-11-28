<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "histories";

    protected $primaryKey = "id";

    protected $fillable = [
        'idTransaksi',
        'idReview',
        'status',
    ];

    public function transaksi(){
        return $this->belongsTo(Transaksi::class);
    }

    public function review(){
        return $this->belongsTo(Review::class);
    }
}
