import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/notifiers/popular_notifier.dart';
import 'package:let_api_flutter/src/core/riverpods/states/popular_state.dart';

final popularProvider =
    StateNotifierProvider<PopularNotifier, PopularState>((ref) {
  return PopularNotifier();
});
