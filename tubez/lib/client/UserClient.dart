import 'package:tubez/entity/User.dart';

import 'dart:convert';
import 'package:http/http.dart';

class UserClient {
  // sesuaikan url dan endpoint dengan device yang digunakan

  //untuk emulator
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api';

  // untuk hp
  // static final String url = 'ipv4 kalian';
  // static final String endpoint = '/GD_API_1697/public/api/user';

  // mengambil semua data user dari API
  static Future<List<User>> fetchAll() async{
    try{
      var response = await get(Uri.http(url, endpoint));

      if(response.statusCode != 200) throw Exception(response.reasonPhrase);

      //mengambil bagian data dari response body
      Iterable list = json.decode(response.body)['data'];

      // list.map untuk membuat list objek User berdasarkan tiap elemen dari list
      return list.map((e) => User.fromJson(e)).toList();
    }catch(e){
      return Future.error(e.toString());
    }
  }

  // Mengambil data User dari API sesuai ID
  static Future<User> find(id) async {
    try{
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if(response.statusCode != 200) throw Exception(response.reasonPhrase);

      return User.fromJson(json.decode(response.body)['data']);
    }catch (e){
      return Future.error(e.toString());
    }
  }

  // Membuat data User baru
  static Future<Response> register(User user) async{
    try{
      var response = await post(Uri.http(url, '$endpoint/register'),
          headers: {"Content-Type": "application/json"},
          body: user.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    }catch(e){
      return Future.error(e.toString());
    }
  }

  // Login

  static Future<Map<String, dynamic>> login(String email, String password) async{
    try{
      var response = await post(Uri.http(url, '$endpoint/login'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Map<String, dynamic> data = json.decode(response.body);
      return data;
    }catch(e){
      return Future.error(e.toString());
    }
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

}