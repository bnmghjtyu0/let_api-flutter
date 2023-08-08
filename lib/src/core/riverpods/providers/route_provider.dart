import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/notifiers/route_notifier.dart';

final goRouterNotifierProvider = Provider<GoRouterNotifier>((ref) {
  return GoRouterNotifier();
});
