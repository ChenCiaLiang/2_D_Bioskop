<?php

namespace App\Http\Controllers;
use App\Models\Transaksi;
use Exception;
use Illuminate\Http\Request;

class TransaksiController extends Controller
{
    public function getAll()
    {
        $allKursiDipesan = Transaksi::all()->pluck('kursiDipesan');

        // Return a flat array if you need all seats as a single list
        $flatKursiDipesan = $allKursiDipesan->flatten()->toArray();

        return Transaksi::all();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'idUser' => 'required|integer',
            'idPemesananTiket' => 'required|integer',
            'metodePembayaran' => 'required|string',
            'totalHarga' => 'required|numeric',
            'kursiDipesan' => 'required|array', // Ensure it's an array
        ]);
        
        // Fetch all existing booked seats and decode kursiDipesan
        $existingSeats = Transaksi::all()
        ->pluck('kursiDipesan')
        ->map(function ($item) {
            return json_decode($item, true); // Decode JSON string to array
        })
        ->flatten()
        ->toArray();
        
        // Check for seat conflicts
        $conflictingSeats = array_intersect($validated['kursiDipesan'], $existingSeats);
        
        if (!empty($conflictingSeats)) {
            return response()->json([
                'message' => 'Seats are taken',
                'conflictingSeats' => $conflictingSeats
            ], 401); // 400 Bad Request
        }
        
        // Encode kursiDipesan as a JSON string before saving
        $validated['kursiDipesan'] = json_encode($validated['kursiDipesan']);
        
        // Store the new transaction
        $transaksi = Transaksi::create($validated);
        try{
            
            return response()->json([
                'status' => true,
                'message' => 'Transaksi created successfully',
                'data' => $transaksi
            ], 200); // 200 Created
        }catch(Exception $e){
            return response()->json([
                'status' => false,
                'message' => $e->getMessage()
            ], 401); // 500 Internal Server Error
        }
    }
}
