import 'package:flutter/material.dart';

///用來取得 global context 的服務
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext getContext() => navigatorKey.currentState!.overlay!.context;
}
