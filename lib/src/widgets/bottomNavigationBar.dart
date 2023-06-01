import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/food-delivery/main.dart';
import 'package:let_api_flutter/src/pages/home.dart';
import 'package:let_api_flutter/src/utils/colors.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

// BottomNavigationBar 狀態管理
class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
        ],
      ),
      bottomNavigationBar:
          createNavigationBar(context, _selectedIndex, _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const MainFoodPage(),
          const MyHomePage(title: '123'),
          Text(
            'Index 2: School',
            style: optionStyle,
          ),
          Text(
            'Index 3: Settings',
            style: optionStyle,
          ),
        ].elementAt(index);
      },
    };
  }

//解決換頁時，BottomNavigator 消失的問題
  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}

//建立 NavigationBar
Container createNavigationBar(
    BuildContext context, _selectedIndex, _onItemTapped) {
  return Container(
      child: ClipRRect(
          child: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: AppColors.mainColor,
    unselectedItemColor: Colors.black45,
    iconSize: 25,
    unselectedFontSize: 12,
    showUnselectedLabels: true,
    backgroundColor: Colors.white,
    onTap: _onItemTapped,
  )));
}
