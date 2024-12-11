import 'dart:developer';

import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubez/entity/pemesanantiket.dart';

class PemesananTiketClient {
  // sesuaikan url dan endpoint dengan device yang digunakan

  //untuk emulator
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api';

  static Future<List<PemesananTiket>> getAllKursi() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      var response = await get(Uri.http(url, '$endpoint/kursi/all'), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      final List<dynamic> parsedJson = json.decode(response.body);
      final List<PemesananTiket> list = parsedJson
          .map((data) => PemesananTiket.fromJson(data as Map<String, dynamic>))
          .toList();
      for (var PemesananTiket in list) {
        log('ID: ${PemesananTiket.id}');
        log('Kursi Dipesan: ${PemesananTiket.kursiDipesan}');
        for (var kursi in PemesananTiket.kursiDipesan) {
          log('Kursi ${PemesananTiket.id}: $kursi');
        }
      }

      return list;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> createPemesananTiket(
      int idJadwalTayang,
      List<String> kursiDipesan) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      final data = PemesananTiket(
        idJadwalTayang: idJadwalTayang,
        kursiDipesan: kursiDipesan,
      );

      log("Data: $data");

      // Encode to JSON
      final bodyData = jsonEncode(data.toJson());
      log("BodyData: $bodyData");

      // Send POST request with headers and body
      var response = await post(
        Uri.http(url, '$endpoint/pemesanantiket'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json", // Set Content-Type header to application/json
        },
        body: bodyData, // Send the JSON data in the body
      );

      print(response.statusCode);

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
