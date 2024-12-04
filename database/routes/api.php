<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\FilmController;
// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post('/register', [UserController::class, 'register']);

Route::post('/login', [UserController::class, 'login']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/logout', [UserController::class, 'logout']);

    Route::get('/index', [UserController::class, 'index']);

    Route::get('history', [HistoryController::class, 'index']);

    Route::get('/kursi/all', [TransaksiController::class, 'getAll']);

    Route::post('/transaksi', [TransaksiController::class, 'store']);

    Route::get('/film/get', [FilmController::class, 'fetchAll']);
});
