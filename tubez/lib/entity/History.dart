import 'dart:convert';

class History {
  BigInt id;
  BigInt idTransaksi;
  BigInt idReview;
  String status;

  History({
    required this.id,
    required this.idTransaksi,
    required this.idReview,
    required this.status,
  });

  factory History.fromRawJson(String str) => History.fromJson(json.decode(str));
  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      idTransaksi: json['idTransaksi'],
      idReview: json['idReview'],
      status: json['status'],
    );
  }

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        'id': id,
        'idTransaksi': idTransaksi,
        'idReview': idReview,
        'status': status,
      };
}
