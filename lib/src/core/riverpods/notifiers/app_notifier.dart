import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/constants/dimensions.dart';
import 'package:let_api_flutter/src/core/riverpods/states/app_state.dart';

///類似 reducer 新增、刪除、修改的方法
class AppNotifier extends StateNotifier<AppState> {
  //需傳入 context
  BuildContext context;

  // 初始值
  AppNotifier({required this.context})
      : super(AppState(dimensions: Dimensions(context)));
}
