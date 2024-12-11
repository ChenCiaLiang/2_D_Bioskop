import 'dart:convert';

class Menu{
  int? id;
  int? idSpesialPromo;
  String jenis;
  String nama;
  double harga;
  String ukuran;
  String deskripsi;
  String? fotoMenu;

  Menu({
    this.id,
    required this.idSpesialPromo,
    required this.jenis,
    required this.nama,
    required this.harga,
    required this.ukuran,
    required this.deskripsi,
    this.fotoMenu,
  });

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json['id'],
    idSpesialPromo: json['idSpesialPromo'],
    jenis: json['jenis'],
    nama: json['nama'],
    harga: json['harga'],
    ukuran: json['ukuran'],
    deskripsi: json['deskripsi'],
    fotoMenu: json['fotoMenu'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'id': id,
    'idSpesialPromo': idSpesialPromo,
    'jenis': jenis,
    'nama': nama,
    'harga': harga,
    'ukuran': ukuran,
    'deskripsi': deskripsi,
    'fotoMenu': fotoMenu,
  };
}

