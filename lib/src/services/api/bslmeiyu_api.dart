// package we need for json encode/decode
import 'package:dio/dio.dart';

// service helper for loading json file
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/src/models/recommend_model.dart';

/// BSL API 服務
class BslmeiyuService {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      responseType: ResponseType.json,
    ),
  );

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
