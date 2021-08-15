import 'package:dio/dio.dart';

class ApiClient {
  final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    sendTimeout: 5000,
    baseUrl: 'https://test-backend-flutter.surfstudio.ru',
  );

  Dio createDio() {
    return Dio(_baseOptions)..interceptors.add(ApiInterceptors());
  }
}

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //print('Request $options');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //print('Error: $err');
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //print('Response: $response');
    return handler.next(response);
  }
}
