<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class SpesialPromo extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "spesialPromos";

    protected $primaryKey = "id";

    protected $fillable = [
        'judul',
        'deskripsi',
        'tanggalBerlaku',
        'harga',
        'ketentuan',
    ];

    public function menu(){
        return $this->hasMany(Menu::class);
    }
}
