import 'dart:convert';

class Transaksi {
  final int? id;
  final int idUser;
  final int idPemesananTiket;
  final String metodePembayaran;
  final double totalHarga;
  final List<String> kursiDipesan;

  Transaksi({
    this.id = null,
    required this.idUser,
    required this.idPemesananTiket,
    required this.metodePembayaran,
    required this.totalHarga,
    required this.kursiDipesan,
  });

  // Factory constructor to parse JSON
  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      idUser:
          json['idUser'] is int ? json['idUser'] : int.parse(json['idUser']),
      idPemesananTiket: json['idPemesananTiket'] is int
          ? json['idPemesananTiket']
          : int.parse(json['idPemesananTiket']),
      metodePembayaran: json['metodePembayaran'],
      totalHarga: json['totalHarga'] is double
          ? json['totalHarga']
          : double.parse(json['totalHarga'].toString()),
      // Decode kursiDipesan string into a List<String>
      kursiDipesan: List<String>.from(jsonDecode(json['kursiDipesan'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idPemesananTiket': idPemesananTiket,
      'metodePembayaran': metodePembayaran,
      'totalHarga': totalHarga,
      // Encode kursiDipesan List<String> into a JSON string
      'kursiDipesan': kursiDipesan,
    };
  }
}
