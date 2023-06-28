// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.

import 'package:flutter/foundation.dart';
import 'package:let_api_flutter/src/core/constants/dimensions.dart';

@immutable
class AppState {
  final Dimensions dimensions;

  const AppState({required this.dimensions});

  AppState copyWith({required Dimensions dimensions}) {
    return AppState(
      dimensions: dimensions,
    );
  }
}
