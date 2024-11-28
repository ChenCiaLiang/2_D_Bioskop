import 'dart:convert';

class User{
  BigInt id;
  String username;
  String password;
  DateTime tanggalLahir;
  String email;
  String noTelepon;
  String foto;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.tanggalLahir,
    required this.email,
    required this.noTelepon,
    required this.foto,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    username: json['username'],
    password: json['password'],
    tanggalLahir: DateTime.parse(json['tanggalLahir']),
    email: json['email'],
    noTelepon: json['noTelepon'],
    foto: json['foto'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'password': password,
    'tanggalLahir': tanggalLahir.toIso8601String(),
    'email': email,
    'noTelepon': noTelepon,
    'foto': foto,
  };

}

