import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/services/api/kkbox-api.dart';
import 'package:let_api_flutter/src/models/kkbox/charts.dart';
import 'package:let_api_flutter/src/ui/screens/music/detail.dart';
import 'package:let_api_flutter/src/constants/colors.dart';

class MusicHomeScreen extends StatefulWidget {
  //定義 props
  final String title;

  const MusicHomeScreen({super.key, required this.title});

  @override
  State<MusicHomeScreen> createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
  late Future<ChartsKKBOXResponse> searchKKBOXData;
  final kkboxAPI = kkboxHttpService();

  @override
  //初始化載入
  void initState() {
    super.initState();
    searchKKBOXData = kkboxAPI.charts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(widget.title),
      ),
      body: FutureBuilder<ChartsKKBOXResponse>(
          future: searchKKBOXData,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.data?.length,
                itemBuilder: (context, index) {
                  var results = snapshot.data?.data ?? [];
                  return results.isEmpty
                      ? Text('')
                      : ListTile(
                          title: Row(children: [
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
                                    results[index].images?[0].url ?? '')),
                            Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                          style: TextStyle(color: Colors.black),
                                          results[index].title ?? '')),
                                ]))
                          ]),
                          onTap: () {
                            final videoId = results[index].id;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDetailPage(videoId: videoId)));
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         HomeDetailPage(videoId: videoId)));
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
          }),
    );
  }
}
