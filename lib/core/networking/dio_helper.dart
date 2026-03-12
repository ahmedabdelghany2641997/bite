import 'package:bite/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        // headers: {"Accept":"application/json","User-Agent":"Mozilla/5.0"}
      ),
    );
  }

  static Future<Response> getdata({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final res = await dio.get(endPoint, queryParameters: queryParameters);
    return res;
  }
}
