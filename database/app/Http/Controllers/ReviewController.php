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
            'film_id' => 'required|integer',
            'rating' => 'required|numeric',
            'review' => 'required|string',
        ]);

        $review = Review::create([
            'film_id' => $request->film_id,
            'rating' => $request->rating,
            'review' => $request->review,
        ]);

        return response()->json(['message' => 'Review submitted successfully'], 200);
    }

    public function edit($id)
    {
        $review = Review::find($id);
        return view('review.edit', compact('review'));
    }
}
