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
  static Future<Response> register(User user) async{
    try{
      var response = await post(Uri.http(url, '$endpoint/register'), // pergi ke /api/register
          headers: {"Content-Type": "application/json"},
          body: user.toRawJson());
          // hasil inputan register kita dalam bentuk user dirubah menjadi json dan dimasukkan ke dalam body

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    }catch(e){
      return Future.error(e.toString());
    }
  }

  // Login

  static Future<bool> login(String email, String password) async{
    try{
      var response = await post(Uri.http(url, '$endpoint/login'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));
          // masukin emiail dan password yang sudah diinput ke dalam body untuk dibawa ke API login

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Map<String, dynamic> data = json.decode(response.body);
      // data dari response body di decode ke dalam bentuk json dan disimpan di variabel data


      if(data['status'] == true){
        // di cek kalau status nya true maka akan diambil token nya, status itu dari controller login di laravel
        String token = data['token'];

        // token disimpan di shared preferences biar bisa diambil dari manapun
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('auth_token', token);
        // nama token di shared preferences nya auth_token

        return true;

      } else {
        return false;
      }
      
    }catch(e){
      return Future.error(e.toString());
    }
  }

  Future<String?> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Mengubah data user sesuai ID
  static Future<Response> update(User user) async{
    try{
      var response = await put(Uri.http(url, '$endpoint/${user.id}'),
          headers: {"Content-Type" : "application/json"},
          body: user.toRawJson());

      if(response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    }catch(e){
      return Future.error(e.toString());
    }
  }

  // Menghapus data user sesuai ID
  static Future<Response> destroy(id) async{
    try{
      var response = await delete(Uri.http(url, '$endpoint/$id'));

      if(response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    }catch(e){
      return Future.error(e.toString());
    }
  }

  static Future<Response> logout() async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      var response = await post(Uri.http(url, '$endpoint/logout'),
          headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"});

      if(response.statusCode != 200) throw Exception(response.reasonPhrase);

      prefs.remove('auth_token');

      return response;
    }catch(e){
      return Future.error(e.toString());
    }
  }

}