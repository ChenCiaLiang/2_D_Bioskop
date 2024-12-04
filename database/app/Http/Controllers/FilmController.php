<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Film;
use Exception;

class FilmController extends Controller
{
    public function fetchAll()
    {
        try{

            $film = Film::all();
            
            if(!$film){
                return response()->json([
                "status" => false,
                "message" => 'gagal',
                "data" => null,
            ], 401);
            }else{
                return response()->json([
                    "status" => true,
                    "message" => 'berhasil',
                    "data" => $film,
                ], 200);
            }

        }catch(Exception $e){
            return response()->json([
                "status" => false,
                "message" => 'gagal',
                "data" => $e->getMessage(),
            ], 401);
        }
    }
}
