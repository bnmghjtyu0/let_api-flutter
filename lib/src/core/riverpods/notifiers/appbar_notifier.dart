// This file is "main.dart"
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/states/appbar_state.dart';

class AppBarNotifier extends StateNotifier<AppBarState> {
  AppBarNotifier(AppBarState? initialTodo)
      : super(initialTodo ?? AppBarState(title: 'title'));

  void update({required String title}) {
    final newState = state.copy(title: title);
    state = newState;
  }
}
