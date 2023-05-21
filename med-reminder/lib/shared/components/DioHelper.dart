import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  Future<Response> GetData(
      {required String path, required Map<String, dynamic> query}) async {
    if (dio == null) {
      print("dio is null");
    }
    return await dio!.get(path, queryParameters: query);
  }
}
