import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/pages/food-delivery/food-delivery-detail.dart';

class App extends StatelessWidget {
  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: FoodDeliveryDetail());
  }
}

//入口
void main() {
  runApp(App());
}
