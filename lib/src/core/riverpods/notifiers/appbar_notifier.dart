import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/states/appbar_state.dart';

///類似 reducer 新增、刪除、修改的方法
class AppBarNotifier extends StateNotifier<AppBarState> {
  AppBarNotifier(AppBarState? initialTodo)
      : super(initialTodo ?? AppBarState(title: 'title'));

  void update({required String title}) {
    final newState = state.copyWith(title: title);
    state = newState;
  }
}
