import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static initialize() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      String url, Map<String, dynamic> query) async {
    return await dio!.get(url, queryParameters: query);
  }
}
