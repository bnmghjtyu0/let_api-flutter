import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/services/api/kkbox-api.dart';
import 'package:let_api_flutter/src/core/models/kkbox/chartDetail.dart';

class HomeDetailPage extends StatefulWidget {
  //影片 ID
  final String? videoId;

  const HomeDetailPage({super.key, required this.videoId});

  @override
  State<HomeDetailPage> createState() => _MyHomeDetailPageState();
}

class _MyHomeDetailPageState extends State<HomeDetailPage> {
  late Future<ChartDetailResponse> chartDetailData;
  final kkboxAPI = KkboxAPIClass();

  //初始化載入
  @override
  void initState() {
    super.initState();
    chartDetailData = kkboxAPI.chartDetail(widget.videoId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('詳細頁'),
      ),
      body: FutureBuilder(
        future: chartDetailData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              Image.network(snapshot.data?.images?[0].url ?? ''),
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data?.tracks?.data?.length,
                    itemBuilder: (context, index) {
                      return Text(
                          snapshot.data?.tracks?.data?[index].name ?? '');
                    }),
              )
            ]);
          } else if (snapshot.hasError) {
            print('error');
            return Container();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
