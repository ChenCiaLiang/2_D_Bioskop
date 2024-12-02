<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use App\Models\Review;
use Illuminate\Support\Facades\Storage;

class ReviewController extends Controller
{
    /**
     * create
     * 
     * @return void
     */
    public function create()
    {
        return view('review.create');
    }

    /**
     * store
     * 
     * @param Request $request
     * @return void
     */
    public function store(Request $request)
    {
        //validate form
        $request->validate(
            [
                'review',
                'rating' => 'required',
            ],
        );

        try {
            Review::create([
                'review' => $request->review,
                'rating' => $request->rating
            ]);

            return view('history.show');
        } catch (Exception $e) {
            return view('history.show');
        }
    }

    public function edit($id)
    {
        $review = Review::find($id);
        return view('review.edit', compact('review'));
    }
}
