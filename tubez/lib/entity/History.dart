import 'dart:convert'; // Untuk jsonDecode
import 'package:intl/intl.dart';
import 'package:tubez/entity/User.dart'; // Pastikan untuk mengimpor paket intl

class History {
  BigInt id;
  BigInt idTransaksi;
  BigInt idReview;
  String status;
  bool isReviewed; // Menggunakan tipe bool
  Transaksi? transaksi;

  History({
    required this.id,
    required this.idTransaksi,
    required this.idReview,
    required this.status,
    required this.isReviewed,
    this.transaksi,
  });

  // Factory constructor untuk parsing JSON
  factory History.fromJson(Map<String, dynamic> json) {
    // Konversi dari TINYINT (0 atau 1) menjadi bool
    bool isReviewed = json['isReview'] == 1; // pastikan key sesuai dengan data

    // Pastikan transaksi ada dan bukan null
    Transaksi? transaksi = json['transaksi'] != null
        ? Transaksi.fromJson(json['transaksi'])
        : null;

    // Pastikan status tidak null dan berikan nilai default jika perlu
    String status = json['status'] ?? '';

    // Menggunakan metode parsing BigInt dengan aman
    return History(
      id: _parseBigInt(json['id']),
      idTransaksi: _parseBigInt(json['idTransaksi']),
      idReview: _parseBigInt(json['idReview']),
      status: status,
      isReviewed: isReviewed,
      transaksi: transaksi,
    );
  }

  // Fungsi untuk parsing BigInt dengan aman
  static BigInt _parseBigInt(dynamic value) {
    // Jika nilai null atau tidak valid, kembalikan BigInt.zero
    if (value == null) {
      return BigInt.zero;
    }
    // Jika nilai berupa string, coba konversi ke BigInt
    if (value is String) {
      return BigInt.tryParse(value) ?? BigInt.zero;
    }
    // Jika sudah berupa BigInt, langsung kembalikan
    if (value is BigInt) {
      return value;
    }
    return BigInt.zero; // fallback
  }

  // Convert object ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'idTransaksi': idTransaksi.toString(),
      'idReview': idReview.toString(),
      'status': status,
      'isReview': isReviewed ? 1 : 0,
      'transaksi': transaksi?.toJson(), // Jika transaksi tidak null
    };
  }
}

class Film {
  int? id;
  String judul;
  String status;
  String durasi;
  String genre;
  String ageRestriction;
  String sinopsis;
  double jumlahRating;
  String? fotoFilm;

  Film({
    required this.id,
    required this.judul,
    required this.status,
    required this.durasi,
    required this.genre,
    required this.ageRestriction,
    required this.sinopsis,
    required this.jumlahRating,
    this.fotoFilm,
  });

  factory Film.fromRawJson(String str) => Film.fromJson(json.decode(str));

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        id: json['id'],
        judul: json['judul'],
        status: json['status'],
        durasi: json['durasi'],
        genre: json['genre'],
        ageRestriction: json['ageRestriction'],
        sinopsis: json['sinopsis'],
        jumlahRating: json['jumlahRating'],
        fotoFilm: json['fotoFilm'],
      );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'status': status,
        'durasi': durasi,
        'genre': genre,
        'ageRestriction': ageRestriction,
        'sinopsis': sinopsis,
        'jumlahRating': jumlahRating,
        'fotoFilm': fotoFilm,
      };
}

class Transaksi {
  final int? id;
  final int idUser;
  final int idPemesananTiket;
  final String metodePembayaran;
  final double totalHarga;
  final List<String> kursiDipesan;
  final int countTiket;
  final User? user;
  final PemesananTiket? pemesananTiket;

  Transaksi({
    this.id,
    required this.idUser,
    required this.idPemesananTiket,
    required this.metodePembayaran,
    required this.totalHarga,
    required this.kursiDipesan,
    required this.countTiket,
    required this.user,
    required this.pemesananTiket,
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
      countTiket: json['kursiDipesan'] is String
          ? List<String>.from(jsonDecode(json['kursiDipesan'])).length
          : json['kursiDipesan'].length,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      pemesananTiket: json['pemesananTiket'] != null
          ? PemesananTiket.fromJson(json['pemesananTiket'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idPemesananTiket': idPemesananTiket,
      'metodePembayaran': metodePembayaran,
      'totalHarga': totalHarga,
      'kursiDipesan': kursiDipesan,
      'users': user,
    };
  }
}

class Studio {
  final int? id;
  final String jenis;
  final int jumlahKursi;
  final double harga;

  Studio({
    required this.id,
    required this.jenis,
    required this.jumlahKursi,
    required this.harga,
  });

  // Factory constructor to parse JSON
  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      jenis: json['jenis'],
      jumlahKursi: json['jumlahKursi'] is int
          ? json['jumlahKursi']
          : int.parse(json['jumlahKursi']),
      harga: json['harga'] is double
          ? json['harga']
          : double.parse(json['harga'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jenis': jenis,
      'jumlahKursi': jumlahKursi,
      'harga': harga,
    };
  }
}

class PemesananTiket {
  final int? id;
  final int idJadwalTayang;
  final List<String> kursiDipesan;
  final JadwalTayang? jadwalTayang;

  PemesananTiket({
    this.id = null,
    required this.idJadwalTayang,
    required this.kursiDipesan,
    required this.jadwalTayang,
  });

  // Factory constructor to parse JSON
  factory PemesananTiket.fromJson(Map<String, dynamic> json) {
    return PemesananTiket(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      idJadwalTayang: json['idJadwalTayang'] is int
          ? json['idJadwalTayang']
          : int.parse(json['idJadwalTayang']),
      // Decode kursiDipesan string into a List<String>
      kursiDipesan: List<String>.from(jsonDecode(json['kursiDipesan'])),
      jadwalTayang: json['jadwalTayang'] != null
          ? JadwalTayang.fromJson(json['jadwalTayang'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idJadwalTayang': idJadwalTayang,
      'kursiDipesan': kursiDipesan,
      'jadwalTayang': jadwalTayang?.toJson(),
    };
  }
}

class JadwalTayang {
  final int? id;
  final int? idStudio;
  final int? idJadwal;
  final int? idFilm;
  final DateTime tanggalTayang;
  final Studio? studio;
  final Film? film;

  JadwalTayang({
    this.id,
    required this.idStudio,
    required this.idJadwal,
    required this.idFilm,
    required this.tanggalTayang,
    required this.studio,
    required this.film,
  });

  // Factory constructor to parse JSON
  factory JadwalTayang.fromJson(Map<String, dynamic> json) {
    return JadwalTayang(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      idStudio: json['idStudio'] is int
          ? json['idStudio']
          : int.parse(json['idStudio']),
      idJadwal: json['idJadwal'] is int
          ? json['idJadwal']
          : int.parse(json['idJadwal']),
      idFilm:
          json['idFilm'] is int ? json['idFilm'] : int.parse(json['idFilm']),
      tanggalTayang: json['tanggalTayang'],
      studio: json['studio'] != null ? Studio.fromJson(json['studio']) : null,
      film: json['film'] != null ? Film.fromJson(json['film']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idStudio': idStudio,
      'idJadwal': idJadwal,
      'idFilm': idFilm,
      'tanggalTayang': tanggalTayang,
      'studio': studio?.toJson(),
      'film': film?.toJson(),
    };
  }
}
