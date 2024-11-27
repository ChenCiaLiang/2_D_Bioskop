import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://127.0.0.1:8000/api'),
  );
}
