import 'package:dio/dio.dart';

class KkboxInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ptMAWr0q45KRB8JO1DiqHA=='
    });
    handler.next(options);
  }
}
