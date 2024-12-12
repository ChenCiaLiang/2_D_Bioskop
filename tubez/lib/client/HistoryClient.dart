import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubez/entity/History.dart'; // Mengimpor model history untuk memetakan data
import 'package:tubez/client/UserClient.dart';

class HistoryClient {
  static final String apiUrl =
      'http://10.0.2.2:8000/api'; // Ganti dengan URL API yang benar

  static Future<List<History>> fetchHistory(int userId) async {
    try {
      UserClient userClient = UserClient();
      String? token = await userClient.getToken();

      final response = await http.get(
        Uri.parse('$apiUrl/history?userId=$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        Iterable list = json.decode(response.body)['history'];
        print('Parsed data: $list');
        return list.map((e) => History.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      print('Error fetching history: $e');
      return [];
    }
  }
}
