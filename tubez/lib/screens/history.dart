import 'package:flutter/material.dart';
import 'package:tubez/widgets/historyWidgets/historyHeader.dart';
import 'package:tubez/entity/History.dart'; // Mengimpor model History
import 'package:tubez/client/HistoryClient.dart'; // Mengimpor HistoryClient untuk mengambil data
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubez/client/UserClient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryClient _historyClient = HistoryClient();
  int? userId; // Menyimpan userId yang akan digunakan

  // Fungsi untuk mengambil userId dari token
  Future<void> ambilToken() async {
    UserClient userClient = UserClient();
    String? token = await userClient.getToken();

    if (token != null) {
      final response = await userClient.dataUser(token);

      if (response.statusCode == 200) {
        // Mengambil data dari response body
        var data = json.decode(response.body);
        var dataUser = data['data'];

        setState(() {
          userId = dataUser['id']; // Menyimpan userId di state
        });

        print('User ID: $userId');
      } else {
        print('Failed to load user data');
      }
    } else {
      print('Token is null');
    }
  }

  @override
  void initState() {
    super.initState();
    ambilToken(); // Memanggil ambilToken() saat screen pertama kali dimuat
  }

  @override
  Widget build(BuildContext context) {
    if (userId == null) {
      return Scaffold(
        appBar: HistoryHeader(),
        body: Center(child: CircularProgressIndicator()), // Menunggu userId
      );
    }

    return Scaffold(
      appBar: HistoryHeader(),
      body: FutureBuilder<List<History>>(
        future: _historyClient.fetchHistory(
            userId!), // Memanggil fungsi untuk mendapatkan data history
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Menunggu data
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No history found'));
          } else {
            List<History> historyList = snapshot.data!;

            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                History history = historyList[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(history.idReview.toString()),
                    subtitle: Text(history.idTransaksi.toString()),
                    trailing: Text(history.status),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
