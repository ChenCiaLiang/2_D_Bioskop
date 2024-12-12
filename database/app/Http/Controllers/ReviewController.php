<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use App\Models\Review;
use Illuminate\Support\Facades\Storage;

class ReviewController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'idFilm' => 'required',
            'idHistory' => 'required',
            'rating' => 'required|numeric',
            'review' => 'required|string',
        ]);

        $review = Review::create([
            'idFilm' => $request->idFilm,
            'idHistory' => $request->idHistory,
            'rating' => $request->rating,
            'review' => $request->review,
        ]);

        return response()->json([ // respon ketika berhasil
            "status" => true,
            "message" => "Create Review Successful",
        ], 200);
    }

    public function update($id)
    {
        $review = Review::find($id);
        return view('review.edit', compact('review'));
    }
}
