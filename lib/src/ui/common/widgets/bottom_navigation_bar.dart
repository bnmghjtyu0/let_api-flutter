import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';

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
    ///點擊首頁時，滑動到最上面，並刷新 API
    if (index == 0) {
      $refreshIndicatorService.homeKey.currentState?.show();
      $scrollService.scrollToTop($scrollService.scrollController);
    }
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
    return Theme(
        data: Theme.of(context).copyWith(
            // 設定背景顏色
            canvasColor: Colors.white,
            // 設定背景顏色 if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(bodySmall: TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black45,
          selectedItemColor: $styles.colors.mainColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          //相同寬度
          type: BottomNavigationBarType.fixed,
          onTap: _goBranch,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '探索',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '搜尋',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: '登入',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '歷史',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
        ));
  }
}
