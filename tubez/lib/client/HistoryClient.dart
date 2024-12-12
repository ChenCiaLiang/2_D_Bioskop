import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubez/entity/History.dart'; // Mengimpor model history untuk memetakan data
import 'package:tubez/client/UserClient.dart';

class HistoryClient {
  static final String apiUrl =
      'http://10.0.2.2:8000/api'; // Ganti dengan URL API yang benar

  // Fungsi untuk mengambil data history dari API
  static Future<List<History>> fetchHistory() async {
    try {
      UserClient userClient = UserClient();
      String? token = await userClient.getToken();

      final response = await http.get(
        Uri.parse('$apiUrl/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        Iterable data = json.decode(response.body)['history'];
        print('Data received: $data');

        Iterable dataHistory = data.map((e) => History.fromJson(e)).toList();

        print('Data list $dataHistory');

        return data.map((e) => History.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      print('Error: $e');
      return []; // Mengembalikan list kosong jika terjadi error
    }
  }
}
