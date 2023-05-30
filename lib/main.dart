import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/home.dart';

//
class App extends StatelessWidget {
  //建構子
  const App();

  //渲染到畫面
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //global colors
        primaryColor: Colors.lightBlue[400],
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(title: '首頁'),
    );
  }
}

//入口
void main() {
  runApp(const App());
}
