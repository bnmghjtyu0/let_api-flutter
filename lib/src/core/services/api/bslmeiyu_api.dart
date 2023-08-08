// package we need for json encode/decode
import 'package:dio/dio.dart';
// service helper for loading json file
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/core/interceptors/bsimeiyu_interceptor.dart';
import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/models/recommend_model.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    /// api endpoint
    baseUrl: ApiConstants.BASE_URL,
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
    responseType: ResponseType.json,
  ));

  DioClient() {
    _dio.interceptors.add(BsimeiyuInterceptor());
  }

  Dio get dio => _dio;
}

/// BSL API 服務
class BslmeiyuService {
  final Dio _dio = DioClient()._dio;

  ///受歡迎的產品
  Future<Product> productPopular() async {
    final response = await _dio.get(
      ApiConstants.POPULAR_PRODUCT_URI,
      options: Options(method: 'GET'),
    );
    return Product.fromJson(response.data);
  }

  ///推薦的的產品
  Future<Recommend> productRecommend() async {
    final response = await _dio.get(
      ApiConstants.RECOMMENDED_PRODUCT_URI,
      options: Options(method: 'GET'),
    );
    return Recommend.fromJson(response.data);
  }
}
