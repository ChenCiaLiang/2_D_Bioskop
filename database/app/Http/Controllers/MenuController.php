<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Menu;

class MenuController extends Controller
{
    public function index()
    {
        $allMenu = Menu::all();
        return response()->json($allMenu);
    }

    public function search(Request $request)
    {
        
    }
}
