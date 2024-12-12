<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class History extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "histories";

    protected $primaryKey = "id";

    protected $fillable = [
        'idTransaksi',
        'status',
        'isReview',
    ];

    public function transaksi()
    {
        return $this->belongsTo(Transaksi::class, 'idTransaksi', 'id');
    }

    public function review()
    {
        return $this->hasOne(Review::class);
    }
}
