import 'package:dio/dio.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';

/// dio 設定
class DioClient {
  final Dio _dio = Dio(BaseOptions(
    /// api endpoint
    baseUrl: AppConstants.BASE_URL,
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
    responseType: ResponseType.json,
  ));

  DioClient() {
    // _dio.interceptors.add(ErrorInterceptor());
  }

  Dio get dio => _dio;
}
