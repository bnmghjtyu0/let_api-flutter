import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/constants/colors.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavigationBarCustom({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState;
    setState(() {
      _selectedIndex = widget.navigationShell.currentIndex;
    });
  }

  /// Bottom Navigation Bar 切換頁面
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.archive),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Me',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.black45,
      selectedItemColor: AppColors.mainColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _goBranch,
    );
  }
}
