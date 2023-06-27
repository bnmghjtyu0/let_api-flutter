import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/states/appbar_state.dart';
import 'package:let_api_flutter/src/core/riverpods/notifiers/appbar_notifier.dart';

final appBarProvider = StateNotifierProvider<AppBarNotifier, AppBarState>(
    (ref) => AppBarNotifier(AppBarState(title: '')));
