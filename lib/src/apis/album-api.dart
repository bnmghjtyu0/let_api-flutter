import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:let_api_flutter/src/models/album.dart';

//取得相片
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}