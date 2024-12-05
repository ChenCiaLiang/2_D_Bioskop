import 'dart:io';

import 'package:tubez/entity/User.dart';

import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserClient {
  // sesuaikan url dan endpoint dengan device yang digunakan

  //untuk emulator
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api';

  // untuk hp
  // static final String url = 'ipv4 kalian';
  // static final String endpoint = '/GD_API_1697/public/api/user';

  // mengambil semua data user dari API
  // static Future<List<User>> fetchAll() async{
  //   try{
  //     var response = await get(Uri.http(url, endpoint));

  //     if(response.statusCode != 200) throw Exception(response.reasonPhrase);

  //     //mengambil bagian data dari response body
  //     Iterable list = json.decode(response.body)['data'];

  //     // list.map untuk membuat list objek User berdasarkan tiap elemen dari list
  //     return list.map((e) => User.fromJson(e)).toList();
  //   }catch(e){
  //     return Future.error(e.toString());
  //   }
  // }

  // // Mengambil data User dari API sesuai ID
  // static Future<User> find(id) async {
  //   try{
  //     var response = await get(Uri.http(url, '$endpoint/$id'));

  //     if(response.statusCode != 200) throw Exception(response.reasonPhrase);

  //     return User.fromJson(json.decode(response.body)['data']);
  //   }catch (e){
  //     return Future.error(e.toString());
  //   }
  // }

  // Membuat data User baru
  static Future<Response> register(User user) async {
    try {
      var response = await post(
          Uri.http(url, '$endpoint/register'), // pergi ke /api/register
          headers: {"Content-Type": "application/json"},
          body: user.toRawJson());
      // hasil inputan register kita dalam bentuk user dirubah menjadi json dan dimasukkan ke dalam body

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Login

  // static Future<bool> login(String email, String password) async {
  //   try {
  //     var response = await post(Uri.http(url, '$endpoint/login'),
  //         headers: {"Content-Type": "application/json"},
  //         body: json.encode({"email": email, "password": password}));
  //     // masukin emiail dan password yang sudah diinput ke dalam body untuk dibawa ke API login

  //     if (response.statusCode != 200) throw Exception(response.reasonPhrase);

  //     Map<String, dynamic> data = json.decode(response.body);
  //     // data dari response body di decode ke dalam bentuk json dan disimpan di variabel data

  //     if (data['status'] == true) {
  //       // di cek kalau status nya true maka akan diambil token nya, status itu dari controller login di laravel
  //       String token = data['token'];

  //       // token disimpan di shared preferences biar bisa diambil dari manapun
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('auth_token', token);
  //       // nama token di shared preferences nya auth_token
  //       prefs.setString('userId', data['data']['id'].toString());

  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  // static Future<bool> login(String email, String password) async {
  //   try {
  //     var response = await post(
  //       Uri.http(url, '$endpoint/login'),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode({"email": email, "password": password}),
  //     );

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = json.decode(response.body);
  //       print("Login Response: ${data}");

  //       if (data['status'] == true) {
  //         // Jika status = true, simpan token
  //         String token = data['token'];
  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         prefs.setString('auth_token', token);
  //         prefs.setString(
  //             'userId', data['data']['id'].toString()); // Save user ID

  //         return true;
  //       } else {
  //         // Login gagal, tampilkan error message
  //         print("Login failed with message: ${data['message']}");
  //         return false;
  //       }
  //     } else {
  //       print(
  //           "Error: Failed to login with status code: ${response.statusCode}");
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Login error: $e");
  //     return Future.error(e.toString());
  //   }
  // }

  static Future<bool> login(String email, String password) async {
    try {
      var response = await post(Uri.http(url, '$endpoint/login'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));
      // masukin emiail dan password yang sudah diinput ke dalam body untuk dibawa ke API login
      print('anjay mabar ${response.statusCode}');

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Map<String, dynamic> data = json.decode(response.body);
      // data dari response body di decode ke dalam bentuk json dan disimpan di variabel data

      if (data['status'] == true) {
        // di cek kalau status nya true maka akan diambil token nya, status itu dari controller login di laravel
        String token = data['token'];

        // token disimpan di shared preferences biar bisa diambil dari manapun
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('auth_token', token);
        // nama token di shared preferences nya auth_token
        prefs.setString('userId', data['data']['id'].toString());

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<String?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  // Method untuk update user profile
  static Future<Response> update(User user, {File? profileImage}) async {
    try {
      // Mendapatkan token
      final String? token = await UserClient().getToken();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Ambil userId sebagai string dari SharedPreferences dan coba untuk mengonversinya ke int
      String? userIdString = prefs.getString('userId');
      int userId = userIdString != null
          ? int.tryParse(userIdString) ?? 0
          : 0; // Handling jika userId null atau tidak dapat dikonversi

      if (token != null) {
        // Mengirim permintaan PUT ke server
        final response = await put(
          Uri.http(
              url, '$endpoint/update/$userId'), // Menambahkan user id dalam URL
          headers: {
            'Authorization':
                'Bearer $token', // Menambahkan token di header untuk otentikasi
            'Content-Type': 'application/json',
          },
          body: json
              .encode(user.toJson()), // Mengirim data user dalam bentuk JSON
        );

        print(
            'User ID: $userId'); // Debugging: Menampilkan userId yang digunakan
        if (response.statusCode == 200) {
          return response; // Kembalikan response jika berhasil
        } else {
          throw Exception('Failed to update profile: ${response.statusCode}');
        }
      } else {
        throw Exception('Token is missing');
      }
    } catch (e) {
      return Future.error(e.toString()); // Menangani error jika ada
    }
  }

  // Menghapus data user sesuai ID
  static Future<Response> destroy(id) async {
    try {
      var response = await delete(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      var response = await post(Uri.http(url, '$endpoint/logout'), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });

      print('blabla ${response.statusCode}');

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      prefs.remove('auth_token');
      prefs.remove('userId');

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // static Future<Response> logout() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('auth_token');

  //     var response = await post(Uri.http(url, '$endpoint/logout'), headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     });

  //     if (response.statusCode == 200) {
  //       // Menghapus data setelah logout
  //       prefs.remove('auth_token');
  //       prefs.remove('userId');
  //       return response;
  //     } else {
  //       throw Exception('Logout failed: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  // static Future<Response> logout() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('auth_token');

  //     var response = await post(Uri.http(url, '$endpoint/logout'), headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     });

  //     if (response.statusCode != 200) throw Exception(response.reasonPhrase);

  //     prefs.remove('auth_token');
  //     prefs.remove('userId');

  //     return response;
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  Future<Response> dataUser(String? token) async {
    if (token != null) {
      final response = await get(
        Uri.http(url, '$endpoint/index'),
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
      );
      return response;
    } else {
      return Future.error('Token tidak ada!');
    }
  }
}
