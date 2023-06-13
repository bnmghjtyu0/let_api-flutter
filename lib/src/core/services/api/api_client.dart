import 'package:get/get.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String url) async {
    //Success
    try {
      Response response = await get(url);
      return response;
    }
    //Fail
    catch (err) {
      return Response(statusCode: 1, statusText: err.toString());
    }
  }
}
