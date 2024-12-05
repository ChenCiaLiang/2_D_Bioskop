import 'dart:convert';

class Menu{
  int? id;
  int? idSpesialPromo;
  String makanan;
  String minuman;
  double harga;
  String ukuran;
  String deskripsi;
  String? fotoMenu;

  Menu({
    this.id,
    required this.idSpesialPromo,
    required this.makanan,
    required this.minuman,
    required this.harga,
    required this.ukuran,
    required this.deskripsi,
    this.fotoMenu,
  });

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json['id'],
    idSpesialPromo: json['idSpesialPromo'],
    makanan: json['makanan'],
    minuman: json['minuman'],
    harga: json['harga'],
    ukuran: json['ukuran'],
    deskripsi: json['deskripsi'],
    fotoMenu: json['fotoMenu'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'id': id,
    'idSpesialPromo': idSpesialPromo,
    'makanan': makanan,
    'minuman': minuman,
    'harga': harga,
    'ukuran': ukuran,
    'deskripsi': deskripsi,
    'fotoMenu': fotoMenu,
  };
}

