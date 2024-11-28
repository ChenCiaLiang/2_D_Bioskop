<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "reviews";

    protected $primaryKey = "id";

    protected $fillable = [
        'idFilm',
        'review',
        'rating',
    ];

    public function film(){
        return $this->belongsTo(Film::class);
    }

    public function history(){
        return $this->hasOne(History::class);
    }

}
