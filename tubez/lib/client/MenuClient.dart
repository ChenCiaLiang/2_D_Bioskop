import 'package:tubez/entity/Menu.dart';

import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuClient{
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/menu';

  static Future<List<Menu>> fetchAll() async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      var response = await get(Uri.http(url, '$endpoint/get'), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"});

      if(response.statusCode != 200){
        print(response.statusCode);
        throw Exception(response.reasonPhrase);
      } 

      Iterable list = json.decode(response.body)['data'];

      List<Menu> allMenus = list.map((e) => Menu.fromJson(e)).toList();

      List<Menu> makananList = allMenus.where((menu) => menu.makanan.isNotEmpty).toList();
      List<Menu> minumanList = allMenus.where((menu) => menu.minuman.isNotEmpty).toList();

      // return list.map((e) => Menu.fromJson(e)).toList();
      return allMenus;
    }catch(e){
      return Future.error('-_- ${e.toString()}');
    }
  }
}