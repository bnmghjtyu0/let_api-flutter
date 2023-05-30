import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/apis/kkbox-api.dart';

import '../models/search-kkbox-api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<SearchKKBOX> searchKKBOXData;
  final kkboxAPI = KkboxAPIClass();

  @override
  //初始化載入
  void initState() {
    super.initState();
    searchKKBOXData = kkboxAPI.search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.title),
        ),
        body: FutureBuilder<SearchKKBOX>(
            future: searchKKBOXData,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.tracks!.data!.length,
                  itemBuilder: (context, index) {
                    var tracks = snapshot.data?.tracks?.data ?? [];
                    return tracks.isEmpty
                        ? Text('123')
                        : Text(tracks[index].url ?? '');
                  },
                );
                // return PhotosList(photos: snapshot.data!.tracks!.data);
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Container(); // 失敗回傳空資料
              }
              // 載入時轉圈圈
              return const CircularProgressIndicator();
            }));
  }
}
