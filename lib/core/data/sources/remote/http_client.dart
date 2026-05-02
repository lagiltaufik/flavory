import 'package:dio/dio.dart';
import 'package:flavory/core/utils/interceptors/api_key_interceptor.dart';
import 'package:flavory/core/utils/interceptors/failure_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClient {
  HttpClient._()
    : _dio = Dio(
        BaseOptions(
          baseUrl: "https://api.spoonacular.com",
          sendTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 5),
          headers: {"Content-Type": "application/json"},
        ),
      ) {
    _dio.interceptors.addAll([
      ApiKeyInterceptor(dotenv.env['API_KEY']!),
      FailureInterceptor(),
    ]);
  }
  final Dio _dio;

  Dio get http => _dio;

  static HttpClient? _instance;
  factory HttpClient() {
    _instance ??= HttpClient._();
    return _instance!;
  }
}