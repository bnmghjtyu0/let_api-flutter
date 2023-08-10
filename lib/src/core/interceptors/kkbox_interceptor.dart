// ignore_for_file: lines_longer_than_80_chars

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/widgets/dialogs/error_dialog.dart';

class KkboxInterceptor extends Interceptor {
  final context = $context;

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
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    $dialogDispatch.showErrorDialog(ErrorDialogData(
        title: err.response?.statusCode?.toString() ?? '',
        content: err.requestOptions.path));

    return handler.next(err);
  }
}
