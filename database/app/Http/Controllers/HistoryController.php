<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use App\Models\Transaksi;

class HistoryController extends Controller
{
    /**
     * Tampil data history berdasarkan user_id yang didapatkan dari join transaksi dan user
     */
    public function index(Request $request)
    {
        try {
            // Ambil user_id dari parameter request
            $userId = $request->input('user_id');

            // Validasi jika user_id tidak ada dalam request
            if (!$userId) {
                return response()->json([
                    "status" => false,
                    "message" => "User ID is required"
                ], 400);
            }

            // Mengambil transaksi yang terkait dengan user_id dan join ke tabel history
            $history = Transaksi::join('users', 'transaksi.idUser', '=', 'users.id')
                ->join('histories', 'transaksi.id', '=', 'history.idTransaksi')
                ->where('transaksi.idUser', $userId)
                ->get(['histories.*']);  // Ambil hanya kolom-kolom dari tabel history

            // Cek apakah ada data history
            if ($history->isEmpty()) {
                return response()->json([
                    "status" => false,
                    "message" => "No history found for this user",
                ], 404);
            }

            return response()->json([
                "status" => true,
                "message" => "Get successful",
                "history" => $history
            ], 200);

        } catch (Exception $e) {
            return response()->json([
                "status" => false,
                "message" => "Something went wrong",
                "history" => $e->getMessage()
            ], 400);
        }
    }
}
