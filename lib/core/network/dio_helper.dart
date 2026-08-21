// core/helper/dio_helper.dart
import 'package:bookia_app/core/network/apis.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Apis.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
      ),
    );
  }

  static Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParametars,
  }) {
    return dio.post(
      endPoint,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParametars,
    );
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParametars,
  }) {
    return dio.get(
      endPoint,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParametars,
    );
  }
}
