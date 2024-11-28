<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use App\Models\History;
use Illuminate\Support\Facades\Storage;

class HistoryController extends Controller
{
    /**
     * index
     * 
     * @return void
     */
    public function show()
    {
        //get history
        $history = History::all();
        //render view with posts
        return view('history.show', compact('history'));
    }
}
