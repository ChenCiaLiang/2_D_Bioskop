<?php

namespace App\Http\Controllers;

use App\Models\History;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Exception;
use DB;

class HistoryController extends Controller
{
    public function index(Request $request)
    {
        try {
            // Ambil user_id dari parameter request atau autentikasi user yang sedang login
            $userId = $request->input('user_id') ?? Auth::id(); // Gunakan Auth::id() jika tidak ada user_id di request

            // Mengambil history, transaksi, dan pemesanantikets berdasarkan user_id
            $historyData = DB::table('transaksis as t')
                ->join('users as u', 't.idUser', '=', 'u.id')  // Join dengan tabel 'users' untuk mengambil user_id
                ->leftJoin('histories as h', 't.id', '=', 'h.idTransaksi') // Join dengan tabel 'histories' untuk mendapatkan data history
                ->leftJoin('pemesanantikets as p', 't.idPemesananTiket', '=', 'p.id') // Join dengan tabel 'pemesanantikets' untuk mendapatkan data pemesanantikets
                ->leftJoin('films as f', 'p.idFilm', '=', 'f.id') // Join dengan tabel 'films' untuk mendapatkan data film
                ->leftJoin('jadwaltayangs as j', 'p.idJadwalTayang', '=', 'j.id') // Join dengan tabel 'jadwaltayangs' untuk mendapatkan data jadwaltayangs
                ->leftJoin('studios as s', 'j.idStudio', '=', 's.id') // Join dengan tabel 'studios' untuk mendapatkan data studio
                ->leftJoin('jadwals as jd', 'j.idJadwal', '=', 'jd.id') // Join dengan tabel 'jadwals' untuk mendapatkan data jadwals
                ->where('u.id', $userId)  // Menyaring berdasarkan user_id yang sedang login
                ->select('t.*', 'h.*', 'p.*', 'f.*', 'j.*', 's.*', 'jd.*') // Ambil kolom dari tabel 'transaksis', 'histories', 'pemesanantikets', 'films', 'jadwaltayangs', 'studios', dan 'jadwals'
                ->get(); // Ambil hasilnya

            // Jika tidak ada data yang ditemukan
            if ($historyData->isEmpty()) {
                return response()->json([
                    'status' => false,
                    'message' => 'No history found for this user',
                    'history' => [],
                ], 404);
            }

            // Mengembalikan data yang sudah diambil
            return response()->json([
                'status' => true,
                'message' => 'History, transaction, and ticket reservation data retrieved successfully',
                'history' => $historyData,
            ], 200);

        } catch (Exception $e) {
            // Menangani error jika terjadi
            return response()->json([
                'status' => false,
                'message' => 'Error: ' . $e->getMessage(),
                'history' => [],
            ], 400);
        }
    }
}
