///專案共用常數
class ApiConstants {
  ///bslmeiyu api host
  static const String baseUrl = String.fromEnvironment('apiUrl');

  ///bslmeiyu api 連結
  static const String apiUrl =
      String.fromEnvironment('apiUrl') + String.fromEnvironment('API_ENDPOINT');

  ///bslmeiyu popular api
  static const String productsPopular = "/products/popular";

  ///bslmeiyu recommended api
  static const String productsRecommend = "/products/recommended";

  ///bslmeiyu 圖片 api path
  static const String uploadUrl = '/uploads/';
}
