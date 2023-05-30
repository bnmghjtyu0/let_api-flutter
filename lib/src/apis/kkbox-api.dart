import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:let_api_flutter/src/models/search-kkbox-api.dart';

class KkboxAPIClass {
  //取得 api 回傳物件
  Future<SearchKKBOX> search() async {
    final response = await http.get(
      Uri.parse(
          'https://api.kkbox.com/v1.1/search?q=五月天&type=track&territory=TW'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ptMAWr0q45KRB8JO1DiqHA=='
      },
    );

    if (response.statusCode == 200) {
      return SearchKKBOX.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          response.statusCode.toString() + 'Failed to load kkbox search api');
    }
  }
}
