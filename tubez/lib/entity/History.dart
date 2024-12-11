import 'dart:convert'; // Untuk jsonDecode
import 'package:intl/intl.dart'; // Pastikan untuk mengimpor paket intl

class History {
  BigInt id;
  BigInt idTransaksi;
  BigInt idReview;
  String status;
  String judul;
  String fotoFilm;
  String totalHarga;
  BigInt idStudio;
  String tanggalTayang; // Tanggal tayang dalam format dd-MM-yyyy
  bool isReviewed; // Menggunakan tipe bool
  int ticketCount;

  History({
    required this.id,
    required this.idTransaksi,
    required this.idReview,
    required this.status,
    required this.judul,
    required this.fotoFilm,
    required this.totalHarga,
    required this.idStudio,
    required this.tanggalTayang,
    required this.isReviewed,
    required this.ticketCount,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    String? tanggalTayangRaw = json['tanggalTayang'];
    String tanggalTayang = '';

    if (tanggalTayangRaw != null && tanggalTayangRaw.isNotEmpty) {
      try {
        DateTime parsedDate = DateTime.parse(tanggalTayangRaw);
        tanggalTayang = DateFormat('dd-MM-yyyy').format(parsedDate);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    // Konversi dari TINYINT (0 atau 1) menjadi bool
    bool isReviewed =
        json['isReviewed'] == 1; // 1 menjadi true, 0 menjadi false

    // Mendapatkan data kursi_dipesan yang disimpan sebagai string
    String kursiDipesanString = json['kursiDipesan'] ?? '[]';

    // Parse kursi_dipesan string menjadi List<String>
    List<String> kursiList = [];
    try {
      kursiList = List<String>.from(jsonDecode(kursiDipesanString));
    } catch (e) {
      print('Error parsing kursiDipesan string: $e');
    }

    // Menghitung jumlah kursi yang dipesan
    int ticketCount = kursiList.length;

    // Mengubah totalHarga ke format string ribuan (misalnya "90.000")
    double totalHargaDouble = json['totalHarga']?.toDouble() ?? 0.0;
    String totalHargaString =
        NumberFormat("#,###", "id_ID").format(totalHargaDouble);

    return History(
      id: _parseBigInt(json['id']),
      idTransaksi: _parseBigInt(json['idTransaksi']),
      idReview: _parseBigInt(json['idReview']),
      status: json['status'] ?? '',
      judul: json['judul'] ?? '',
      fotoFilm: json['fotoFilm'] ?? '',
      totalHarga:
          totalHargaString, // Menyimpan totalHarga sebagai string format ribuan
      idStudio: _parseBigInt(json['idStudio']),
      tanggalTayang: tanggalTayang,
      isReviewed: isReviewed, // Assign nilai boolean
      ticketCount: ticketCount, // Misalnya ticketCount
    );
  }

  static _parseBigInt(dynamic value) {
    try {
      if (value is String) {
        return BigInt.parse(value);
      } else if (value is int) {
        return BigInt.from(value);
      } else {
        return BigInt.zero;
      }
    } catch (e) {
      print('Error parsing BigInt: $e');
      return BigInt.zero;
    }
  }

  Map<String, dynamic> toJson() {
    // Mengubah totalHarga string kembali ke double
    double totalHargaDouble = _parseTotalHargaToDouble(totalHarga);

    return {
      'id': id.toString(),
      'idTransaksi': idTransaksi.toString(),
      'idReview': idReview.toString(),
      'status': status,
      'judul': judul,
      'fotoFilm': fotoFilm,
      'totalHarga': totalHargaDouble, // Mengembalikan totalHarga menjadi double
      'idStudio': idStudio.toString(),
      'tanggalTayang': tanggalTayang,
      'isReviewed': isReviewed ? 1 : 0, // Mengonversi bool ke TINYINT
      'ticketCount': ticketCount,
    };
  }

  // Helper function untuk mengubah string format ribuan ke double
  double _parseTotalHargaToDouble(String totalHargaString) {
    try {
      // Menghapus pemisah ribuan (misalnya "90.000" menjadi "90000")
      String cleaned = totalHargaString.replaceAll('.', '');

      // Mengambil hanya bagian sebelum titik desimal jika ada
      int dotIndex = cleaned.indexOf('.');
      if (dotIndex != -1) {
        cleaned = cleaned.substring(0, dotIndex); // Ambil bagian sebelum titik
      }

      return double.parse(cleaned);
    } catch (e) {
      print('Error parsing totalHarga to double: $e');
      return 0.0;
    }
  }
}
