<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Menu extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "menus";

    protected $primaryKey = "id";

    protected $fillable = [
        'idSpesialPromo',
        'makanan',
        'minuman',
        'harga',
        'ukuran',
        'deskripsi',
        'fotoMenu',
    ];

    public function spesialPromo(){
        return $this->belongsTo(SpesialPromo::class);
    }
}