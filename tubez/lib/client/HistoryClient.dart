import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubez/entity/History.dart'; // Mengimpor model history untuk memetakan data

class HistoryClient {
  final String apiUrl =
      'http://10.0.2.2:8000/api/history'; // Ganti dengan URL API yang benar

  // Fungsi untuk mengambil data history dari API
  Future<List<History>> fetchHistory(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/$userId'), // Kirim userId ke API endpoint
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body); // Parsing data JSON
        return data
            .map((item) => History.fromJson(item))
            .toList(); // Convert JSON ke List<History>
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
