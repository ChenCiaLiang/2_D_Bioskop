import 'dart:convert';

class PemesananTiket {
  final int? id;
  final int idJadwalTayang;
  final List<String> kursiDipesan;

  PemesananTiket({
    this.id = null,
    required this.idJadwalTayang,
    required this.kursiDipesan,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idJadwalTayang' : idJadwalTayang,
      // Encode kursiDipesan List<String> into a JSON string
      'kursiDipesan': kursiDipesan,
    };
  }
}
