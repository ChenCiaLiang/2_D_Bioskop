import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubez/entity/History.dart'; // Mengimpor model history untuk memetakan data

class HistoryClient {
  final String apiUrl =
      'http://10.0.2.2:8000/api/history'; // Ganti dengan URL API yang benar

  // Fungsi untuk mengambil data history dari API
  Future<List<History>> fetchHistory(int userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse('$apiUrl/$userId'), // Kirim userId ke API endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<History> historyList = [];

        if (data.isNotEmpty) {
          // Jika data tidak kosong, lakukan pemetaan
          for (var item in data) {
            historyList.add(History.fromJson(
                item)); // Memetakan JSON ke dalam model History
          }
        }

        return historyList;
      } else if (response.statusCode == 404) {
        // Jika status code 404, kembalikan list kosong tanpa error
        print('No data found for this user.');
        return [];
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
