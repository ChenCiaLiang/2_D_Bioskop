import 'dart:developer';

import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubez/model/transaksi.dart';

class TransaksiClient {
  // sesuaikan url dan endpoint dengan device yang digunakan

  //untuk emulator
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api';

  static Future<List<Transaksi>> getAllKursi() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      var response = await get(Uri.http(url, '$endpoint/kursi/all'), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      final List<dynamic> parsedJson = json.decode(response.body);
      final List<Transaksi> list = parsedJson
          .map((data) => Transaksi.fromJson(data as Map<String, dynamic>))
          .toList();
      for (var transaksi in list) {
        log('ID: ${transaksi.id}');
        log('Kursi Dipesan: ${transaksi.kursiDipesan}');
        for (var kursi in transaksi.kursiDipesan) {
          log('Kursi ${transaksi.id}: $kursi');
        }
      }

      return list;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> createTransaksi(
      int idPemesananTiket,
      String metodePembayaran,
      double totalHarga,
      List<String> kursiDipesan) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = int.parse(prefs.getString('userId')!);
      String? token = prefs.getString('auth_token');

      final data = Transaksi(
        idUser: userId,
        idPemesananTiket: idPemesananTiket,
        metodePembayaran: metodePembayaran,
        totalHarga: totalHarga,
        kursiDipesan: kursiDipesan,
      );

      log("Data: $data");

      // Encode to JSON
      final bodyData = jsonEncode(data.toJson());
      log("BodyData: $bodyData");

      // Send POST request with headers and body
      var response = await post(
        Uri.http(url, '$endpoint/transaksi'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type":
              "application/json", // Set Content-Type header to application/json
        },
        body: bodyData, // Send the JSON data in the body
      );

      if (response.statusCode != 200) {
        throw Exception(
            "Error: ${response.statusCode} ${response.reasonPhrase}");
      }

      return response;
    } catch (e) {
      log("Error: ${e.toString()}");
      return Future.error(e.toString());
    }
  }
}
