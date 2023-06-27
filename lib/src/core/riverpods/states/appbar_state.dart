import 'package:freezed_annotation/freezed_annotation.dart';

part 'appbar_state.freezed.dart';
part 'appbar_state.g.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState({required String title}) = _AppBarState;

  factory AppBarState.fromJson(Map<String, dynamic> json) =>
      _$AppBarStateFromJson(json);
}
