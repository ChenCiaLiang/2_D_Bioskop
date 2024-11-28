<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PemesananTiket extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "pemesananTikets";

    protected $primaryKey = "id";

    protected $fillable = [
        'idStudio',
        'idFilm',
    ];

    public function studio(){
        return $this->belongsTo(Studio::class);
    }

    public function film(){
        return $this->belongsTo(Film::class);
    }
}
