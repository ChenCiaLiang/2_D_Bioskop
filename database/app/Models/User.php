<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class User extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "users";

    protected $primaryKey = "id";

    protected $fillable = [
        'username',
        'password',
        'tanggalLahir',
        'email',
        'noTelepon'
    ];

    public function transaksi(){
        return $this->hasMany(Transaksi::class);
    }

}
