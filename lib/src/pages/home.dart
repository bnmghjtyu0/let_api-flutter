import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/apis/album-api.dart';
import 'package:let_api_flutter/src/widgets/button.dart';
import 'package:let_api_flutter/src/widgets/text.dart';
import '../models/album.dart';
import '../widgets/title.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Album> futureAlbum;

  @override
  //初始化載入
  void initState() {
    print('init');
    super.initState();
    futureAlbum = fetchAlbum();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection(context),
            textSection
          ],
        ));
  }
}
