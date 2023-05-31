import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/apis/kkbox-api.dart';
import 'package:let_api_flutter/src/pages/detail.dart';

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
                        ? Text('')
                        : TextButton(
                            child: Row(children: [
                              Container(
                                  width: 60,
                                  alignment: Alignment.center, // 內裝元件置中對齊
                                  decoration: BoxDecoration(
                                    // 裝飾內裝元件
                                    color: Colors.white, // 背景
                                    border: Border.all(
                                        width: 1, color: Colors.white), // 藍色邊框
                                  ),
                                  padding: const EdgeInsets.all(4), // 墊充
                                  child: Image.network(
                                      tracks[index]?.album?.images?[0].url ??
                                          '')),
                              Flexible(
                                  child: Container(
                                      color: Colors.white,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    tracks[index]
                                                            ?.album
                                                            ?.name ??
                                                        '')),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(tracks[index]
                                                        ?.album
                                                        ?.artist
                                                        ?.name ??
                                                    ''))
                                          ])))
                            ]),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeDetailPage()));
                            },
                          );
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
