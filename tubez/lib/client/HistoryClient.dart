import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubez/entity/History.dart';
import 'package:tubez/client/UserClient.dart';

class HistoryClient {
  static final String apiUrl = 'http://10.0.2.2:8000/api';

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

      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        Iterable list = json.decode(response.body)['history'];

        return list.map((e) => History.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load history');
      }
    } catch (e) {
      print('Error fetching history: $e');
      return [];
    }
  }

  static Future<http.Response> create(History history) async {
    try {
      UserClient userClient = UserClient();
      String? token = await userClient.getToken();
      var response = await http.post(Uri.parse('$apiUrl/history/create'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: history.toRawJson());
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
