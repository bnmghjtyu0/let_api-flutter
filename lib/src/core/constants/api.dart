///專案共用常數
class ApiConstants {
  ///bslmeiyu api host
  static const String BASE_URL = String.fromEnvironment('API_URL');

  ///bslmeiyu api 連結
  static const String API_URL = String.fromEnvironment('API_URL') +
      String.fromEnvironment('API_ENDPOINT');

  ///bslmeiyu popular api
  static const String POPULAR_PRODUCT_URI = "/products/popular";

  ///bslmeiyu recommended api
  static const String RECOMMENDED_PRODUCT_URI = "/products/recommended";

  ///bslmeiyu 圖片 api path
  static const String UPLOAD_URL = '/uploads/';
}
