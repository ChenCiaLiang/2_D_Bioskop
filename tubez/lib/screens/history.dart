import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tubez/widgets/historyWidgets/historyHeader.dart';
import 'package:tubez/entity/History.dart'; // Mengimpor model History
import 'package:tubez/client/HistoryClient.dart'; // Mengimpor HistoryClient untuk mengambil data
import 'package:tubez/client/UserClient.dart';
import 'package:tubez/widgets/historyWidgets/isiHistory.dart'; // Mengimpor IsiHistory

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryClient _historyClient = HistoryClient();
  int? userId; // Menyimpan userId yang akan digunakan
  Future<List<History>>? _historyFuture;

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

        print('User ID: ${userId}');

        // Setelah userId diperoleh, ambil data history
        if (userId != null) {
          setState(() {
            _historyFuture = _historyClient.fetchHistory(userId!);
          });
        }
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
    // Jika userId masih null atau _historyFuture belum diinisialisasi, tampilkan loading indicator
    if (userId == null || _historyFuture == null) {
      return Scaffold(
        appBar: HistoryHeader(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Jika userId sudah terisi, maka tampilkan data history
    return Scaffold(
      appBar: HistoryHeader(),
      body: FutureBuilder<List<History>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No History Found',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            List<History> historyList = snapshot.data!;

            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                History history = historyList[index];
                return IsiHistory(
                  image:
                      'http://10.0.2.2:8000${history.fotoFilm}', // Gambar film
                  title: history.judul, // Judul film
                  status: history.status, // Status film
                  studio: history.idStudio.toInt(), // ID studio
                  date: history.tanggalTayang, // Tanggal tayang
                  total: 'Rp ${history.totalHarga}', // Total harga
                  isReviewed: history.isReviewed, // Sudah review apa belum
                  ticketCount: history.ticketCount, // Jumlah tiket
                );
              },
            );
          }
        },
      ),
    );
  }
}
