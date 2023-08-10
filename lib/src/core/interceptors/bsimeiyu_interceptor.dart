// ignore_for_file: lines_longer_than_80_chars

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/core/utils/logger_util.dart';
import 'package:let_api_flutter/src/widgets/dialogs/error_dialog.dart';

class BsimeiyuInterceptor extends Interceptor {
  static dynamic context;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger(options.uri.path);
    return handler.next(options);
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
