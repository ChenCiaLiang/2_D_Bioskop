import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubez/entity/History.dart'; // Mengimpor model history untuk memetakan data
import 'package:tubez/client/UserClient.dart';

class HistoryClient {
  final String apiUrl =
      'http://10.0.2.2:8000/api'; // Ganti dengan URL API yang benar

  // Fungsi untuk mengambil data history dari API
  Future<List<History>> fetchHistory(int userId) async {
    try {
      UserClient userClient = UserClient();
      String? token = await userClient.getToken();

      if (userId == null) {
        throw Exception("User ID is missing");
      }

      final response = await http.get(
        Uri.parse('$apiUrl/history?user_id=$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body); // Decode JSON data from response
        print('Response Data: $data'); // Log the raw response data

        // Pastikan data['history'] tidak null
        if (data['history'] != null && data['history'] is List) {
          List<History> historyList = (data['history'] as List)
              .map((historyData) => History.fromJson(historyData))
              .toList();
          return historyList;
        } else {
          // Jika data['history'] tidak ditemukan atau tidak berupa list
          return [];
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
