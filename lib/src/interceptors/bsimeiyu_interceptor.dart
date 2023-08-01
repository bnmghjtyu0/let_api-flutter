import 'package:dio/dio.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/common/widgets/dialogs/error_dialog.dart';

class BsimeiyuInterceptor extends Interceptor {
  static dynamic context;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    $dialogDispatch.showErrorDialog(ErrorDialogData(
        title: err.response?.statusCode?.toString() ?? '',
        content: err.requestOptions.path));

    return handler.next(err);
  }
}
