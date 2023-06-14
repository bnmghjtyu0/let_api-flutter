import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/screens/food_delivery/main_food_page.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/screens/music/music_home_screen.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

// BottomNavigationBar 狀態管理
class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int _selectedIndex = 0;
  List<dynamic> pages = [
    MainFoodPage(),
    MusicHomeScreen(title: '123'),
    Container(
      child: Center(child: Text('cart')),
    ),
    Container(child: Center(child: Text('me')))
  ];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.black45,
        //顯示 label
        showSelectedLabels: true,
        //目前頁碼
        currentIndex: _selectedIndex,
        //點擊
        onTap: onTapNav,
        //文字大小
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        iconSize: 25,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'me',
          ),
        ],
      ),
    );
  }
}
