import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/routes/main_route.dart';

class CommonDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CommonDrawer({Key? key, required this.navigationShell})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
            ),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              //大圖
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    //double.maxFinite: 最大值
                    width: double.maxFinite,
                    height: Dimensions(context).popularFoodImgSize(),
                    // height: PlaceholderDimensions(context).popularFoodImgSize(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/lake.jpg'))),
                  )),
              // Positioned(child: Text('Drawer Header'))
            ])),
        ListTile(
          title: Text('Home',
              style: TextStyle(
                  color: navigationShell.currentIndex == 0
                      ? AppColors.mainColor
                      : null)),
          onTap: () {
            GoRouter.of(context).goNamed(RouteNames.foodHome);
          },
        ),
        ListTile(
          title: Text('Music',
              style: TextStyle(
                  color: navigationShell.currentIndex == 1
                      ? AppColors.mainColor
                      : null)),
          onTap: () {
            GoRouter.of(context).goNamed(RouteNames.musicHome);
          },
        ),
      ],
    ));
  }
}
