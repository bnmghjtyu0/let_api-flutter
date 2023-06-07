import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/pages/food_delivery/recommend_detail.dart';

class App extends StatelessWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: RecommendDetailWidget());
  }
}

//入口
void main() {
  runApp(App());
}
