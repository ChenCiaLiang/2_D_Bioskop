<?php

use App\Http\Controllers\PemesananTiketController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\SpesialPromoController;
use App\Http\Controllers\FilmController;
use App\Http\Controllers\JadwalTayangController;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post('/register', [UserController::class, 'register']);

Route::post('/login', [UserController::class, 'login']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/logout', [UserController::class, 'logout']);

    Route::get('/index', [UserController::class, 'index']);

    Route::post('/update/{id}', [UserController::class, 'update']);

    Route::get('/history', [HistoryController::class, 'index']);

    Route::post('/history/create', [HistoryController::class, 'store']);

    Route::post('/review/create', [ReviewController::class, 'store']);

    Route::get('/kursi/all', [PemesananTiketController::class, 'getAll']);

    Route::post('/pemesanantiket', [PemesananTiketController::class, 'store']);

    Route::get('/menu/get', [MenuController::class, 'fetchAll']);
    Route::get('/menu/find/{nama}', [MenuController::class, 'find']);
    Route::get('/spesialPromo/get', [SpesialPromoController::class, 'fetchAll']);

    Route::get('/film/get', [FilmController::class, 'fetchAll']);
    Route::get('/film/find/{judul}', [FilmController::class, 'find']);

    Route::get('/jadwaltayang/get/{id}', [JadwalTayangController::class, 'fetchByIdFilm']);
});