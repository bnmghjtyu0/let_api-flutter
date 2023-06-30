import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/riverpods/notifiers/appbar_notifier.dart';
import 'package:let_api_flutter/src/riverpods/states/appbar_state.dart';

final appBarProvider = StateNotifierProvider<AppBarNotifier, AppBarState>(
    (ref) => AppBarNotifier(AppBarState(title: '')));
