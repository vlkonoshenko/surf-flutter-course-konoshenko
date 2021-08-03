import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@immutable
class NetworkException implements Exception {
  final String route;
  final String text;
  final int? code;

  NetworkException.fromDioError(DioError error)
      : route = '${error.requestOptions.baseUrl}${error.requestOptions.path}',
        text = error.message,
        code = error.response?.statusCode;

  @override
  String toString() {
    return 'В запросе $route возникла ошибка: $code $text';
  }
}
