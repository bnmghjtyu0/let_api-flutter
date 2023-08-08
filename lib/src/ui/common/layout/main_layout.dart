import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/riverpods/providers/appbar_provider.dart';
import 'package:let_api_flutter/src/widgets/widgets.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainLayout({Key? key, required this.navigationShell}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, child) {
      final appBarState = ref.watch(appBarProvider);

      return Scaffold(
        appBar: appBarState.title.isEmpty
            ? null
            : AppBar(title: Text(appBarState.title)),
        body: Center(
          child: navigationShell,
        ),
        // drawer: CommonDrawer(navigationShell: navigationShell),
        bottomNavigationBar:
            BottomNavigationBarCustom(navigationShell: navigationShell),
      );
    });
  }
}
