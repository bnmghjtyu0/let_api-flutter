import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/widgets/base_dialog.dart';

class KkboxInterceptor extends Interceptor {
  static dynamic context;

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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    var baseDialog = BaseAlertDialog(
      title: err.response?.statusCode?.toString() ?? '',
      content: err.requestOptions.path,
      yesOnPressed: () {},
      yes: "確定",
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);

    return handler.next(err);
  }
}
