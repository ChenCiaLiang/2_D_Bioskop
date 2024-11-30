import 'package:flutter/material.dart';
import 'package:tubez/widgets/historyWidgets/historyHeader.dart';
import 'package:tubez/entity/History.dart'; // Mengimpor model History
import 'package:tubez/client/HistoryClient.dart'; // Mengimpor HistoryClient untuk mengambil data

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryClient _historyClient = HistoryClient();

  @override
  Widget build(BuildContext context) {
    // Mengambil userId, bisa didapatkan dari SharedPreferences atau sesi pengguna
    int userId = 123; // Ganti dengan userId yang sesuai

    return Scaffold(
      appBar: HistoryHeader(),
      body: FutureBuilder<List<History>>(
        future: _historyClient.fetchHistory(
            userId), // Memanggil fungsi untuk mendapatkan data history
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
