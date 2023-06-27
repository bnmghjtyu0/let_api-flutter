// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appbar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppBarState _$AppBarStateFromJson(Map<String, dynamic> json) {
  return _AppBarState.fromJson(json);
}

/// @nodoc
mixin _$AppBarState {
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppBarStateCopyWith<AppBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarStateCopyWith<$Res> {
  factory $AppBarStateCopyWith(
          AppBarState value, $Res Function(AppBarState) then) =
      _$AppBarStateCopyWithImpl<$Res, AppBarState>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$AppBarStateCopyWithImpl<$Res, $Val extends AppBarState>
    implements $AppBarStateCopyWith<$Res> {
  _$AppBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppBarStateCopyWith<$Res>
    implements $AppBarStateCopyWith<$Res> {
  factory _$$_AppBarStateCopyWith(
          _$_AppBarState value, $Res Function(_$_AppBarState) then) =
      __$$_AppBarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_AppBarStateCopyWithImpl<$Res>
    extends _$AppBarStateCopyWithImpl<$Res, _$_AppBarState>
    implements _$$_AppBarStateCopyWith<$Res> {
  __$$_AppBarStateCopyWithImpl(
      _$_AppBarState _value, $Res Function(_$_AppBarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_AppBarState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppBarState implements _AppBarState {
  const _$_AppBarState({required this.title});

  factory _$_AppBarState.fromJson(Map<String, dynamic> json) =>
      _$$_AppBarStateFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'AppBarState(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppBarState &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppBarStateCopyWith<_$_AppBarState> get copyWith =>
      __$$_AppBarStateCopyWithImpl<_$_AppBarState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppBarStateToJson(
      this,
    );
  }
}

abstract class _AppBarState implements AppBarState {
  const factory _AppBarState({required final String title}) = _$_AppBarState;

  factory _AppBarState.fromJson(Map<String, dynamic> json) =
      _$_AppBarState.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AppBarStateCopyWith<_$_AppBarState> get copyWith =>
      throw _privateConstructorUsedError;
}
