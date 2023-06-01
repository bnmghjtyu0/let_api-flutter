import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/widgets/bottomNavigationBar.dart';

class App extends StatelessWidget {
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
        home: const BottomNavigationBarCustom());
  }
}

//入口
void main() {
  runApp(App());
}
