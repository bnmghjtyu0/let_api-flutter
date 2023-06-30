import 'package:dio/dio.dart';
import 'package:let_api_flutter/src/interceptors/kkbox_interceptor.dart';
import 'package:let_api_flutter/src/models/kkbox/chartDetail.dart';
import 'package:let_api_flutter/src/models/kkbox/charts.dart';
import 'package:let_api_flutter/src/models/search_kkbox_api.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    /// api endpoint
    baseUrl: 'https://api.kkbox.com',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
    responseType: ResponseType.json,
  ));

  DioClient() {
    _dio.interceptors.add(KkboxInterceptor());
  }

  Dio get dio => _dio;
}

///kkbox api 服務
class kkboxHttpService {
  //取得 api 回傳物件
  Future<SearchKKBOX> search() async {
    final response = await DioClient().dio.get(
          '/v1.1/search?q=五月天&type=track&territory=TW',
        );

    return SearchKKBOX.fromJson(response.data);
  }

  //取得排行榜分類
  Future<ChartsKKBOXResponse> charts() async {
    final response = await DioClient().dio.get(
          '/v1.1/charts?territory=TW',
        );

    return ChartsKKBOXResponse.fromJson(response.data);
  }

  ///取得各分類的排行榜
  Future<ChartDetailResponse> chartDetail(String id) async {
    final response = await DioClient().dio.get(
          '/v1.1/charts/$id?territory=TW',
        );

    return ChartDetailResponse.fromJson(response.data);
  }
}
