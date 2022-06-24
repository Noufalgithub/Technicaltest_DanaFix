import 'package:dio/dio.dart';

class BaseDio {
  Dio get dio => _dio();

  Response? response;

  Dio _dio() {
    final options = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      contentType: "application/json;charset=utf-8",
    );

    var dio = Dio(options);

    // dio.interceptors
    //   ..add(CacheInterceptor())
    //   ..add(LoggingInterceptors(dio));

    return dio;
  }
}
