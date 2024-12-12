import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubez/entity/History.dart'; // Mengimpor model history untuk memetakan data
import 'package:tubez/client/UserClient.dart';

class HistoryClient {
  final String apiUrl =
      'http://10.0.2.2:8000/api'; // Ganti dengan URL API yang benar

  List<History> _historyList = [];

  // Fungsi untuk mengambil data history dari API
  Future<List<History>> fetchHistory() async {
    // Jika data history sudah ada dalam list, langsung kembalikan data tersebut
    if (_historyList.isNotEmpty) {
      print('Mengembalikan data history yang sudah ada...');
      return _historyList;
    }

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
        var data = json.decode(response.body); // Decode JSON data from response
        print('Data received: $data');

        // Pastikan data['history'] tidak null dan ada
        if (data['status'] == true && data['history'] != null) {
          List<History> historyList = (data['history'] as List)
              .map((historyData) => History.fromJson(historyData))
              .toList();

          // Simpan hasil history ke dalam list lokal untuk digunakan di lain waktu
          _historyList = historyList;

          print('Response Data: $_historyList');
          return historyList;
        } else {
          throw Exception('History data is empty or status is false');
        }
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      print('Error: $e');
      return []; // Mengembalikan list kosong jika terjadi error
    }
  }
}
