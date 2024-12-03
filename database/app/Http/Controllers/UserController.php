<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Exception;
use Carbon\Carbon;

class UserController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'tanggalLahir' => 'required',
            'noTelepon' => 'required',
            'email' => 'required|string|email|max:255|unique:users,email',
            'password' => 'required',
        ]);

        try {

            $tanggalLahir = Carbon::createFromFormat('Y-m-d', $request->tanggalLahir)->toDateString();

            User::create([
                'username' => $request->username,
                'tanggalLahir' => $tanggalLahir,
                'noTelepon' => $request->noTelepon,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'foto' => "profilePict/profile.jpg",
            ]);

            return response()->json([ // respon ketika berhasil
                "status" => true,
                "message" => "Register Successful",
            ], 200);

        } catch (Exception $e) {
            return response()->json([ // respon ketika berhasil
                "status" => false,
                "message" => "Register Failed",
            ], 401);
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        try {
            $users = User::where('email', $request->email)->first();

            if (!$users || !Hash::check($request->password, $users->password)) {
                return response()->json([
                    'message' => 'email atau password salah'
                ], 401);
            }


            $token = $users->createToken('Personal Access Token')->plainTextToken;

            return response()->json([ // respon ketika berhasil
                "status" => true,
                "data" => $users,
                'token' => $token
            ], 200);

        } catch (Exception $e) {
            return response()->json([ // respon ketika gagal
                "status" => false,
                "message" => $e,
            ], 401);
        }

    }

    public function logout(Request $request)
    {
        try {
            // Check if the user is authenticated and has a current token
            if ($request->user() && $request->user()->currentAccessToken()) {
                // Delete the current access token
                $request->user()->currentAccessToken()->delete();
            } else {
                // Optional: Delete all tokens if currentAccessToken is null
                if ($request->user()) {
                    $request->user()->tokens()->delete();
                }
            }

            return response()->json([
                'message' => 'Logout Successful'
            ], 200);


        } catch (Exception $e) {
            return response()->json([ // respon ketika gagal
                "status" => false,
                "message" => $e,
            ], 401);
        }
    }

    /**
     * Display a listing of the resource.
     */

    public function index()
    {
        $oneUser = Auth::user();
        return response()->json([
            "status" => true,
            "message" => 'berhasil',
            "data" => $oneUser,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'nama' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users,email,' . Auth::user()->idUser,
                'noTelepon' => 'required',
                'tanggalLahir' => 'required',
                'password' => 'required',
                'confirmPW' => 'required|same:password',
            ]);

            $userId = Auth::user()->idUser;

            $user = User::find($userId);

            if (!$user) {
                return response()->json(['message' => 'User tidak ditemukan'], 403);
            }

            if ($request->hasFile('foto')) {
                $image = $request->foto;
                $imageName = $image->getClientOriginalName();
                $image->move(public_path('profilePict'), $image->getClientOriginalName());

                //Fungsi Simpan Data ke dalam Database
                $user->update([
                    'nama' => $validatedData['nama'],
                    'email' => $validatedData['email'],
                    'noTelepon' => $validatedData['noTelepon'],
                    'tanggalLahir' => $validatedData['tanggalLahir'],
                    'password' => Hash::make($validatedData['password']),
                    'foto' => 'profilePict/' . $imageName,
                ]);

            } else {
                $user->update([
                    'nama' => $validatedData['nama'],
                    'email' => $validatedData['email'],
                    'noTelepon' => $validatedData['noTelepon'],
                    'tanggalLahir' => $validatedData['tanggalLahir'],
                    'password' => Hash::make($validatedData['password']),
                    'foto' => Auth::user()->foto,
                ]);
            }

            return redirect()->route('profile')->with('success', true);
        } catch (Exception $e) {
            dd($e);
            return redirect()->back()->with('error', 'Gagal Update profile.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $userId = Auth::user()->idUser;

        $user = User::find($userId);

        if (!$user) {
            return response()->json(['message' => 'User tidak ditemukan atau anda tidak login'], 403);
        }

        $user->delete();

        return response()->json(['message' => 'User berhasil di hapus.']);
    }

    public function profile()
    {
        // Get the authenticated user
        $user = Auth::user();

        // Pass the user data to the profile view
        return view('profile', compact('user'));
    }

}
