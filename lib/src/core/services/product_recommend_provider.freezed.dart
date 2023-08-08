// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_recommend_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductRecommendState {
  Recommend? get recommend => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductRecommendStateCopyWith<ProductRecommendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRecommendStateCopyWith<$Res> {
  factory $ProductRecommendStateCopyWith(ProductRecommendState value,
          $Res Function(ProductRecommendState) then) =
      _$ProductRecommendStateCopyWithImpl<$Res, ProductRecommendState>;
  @useResult
  $Res call({Recommend? recommend, bool isLoading});

  $RecommendCopyWith<$Res>? get recommend;
}

/// @nodoc
class _$ProductRecommendStateCopyWithImpl<$Res,
        $Val extends ProductRecommendState>
    implements $ProductRecommendStateCopyWith<$Res> {
  _$ProductRecommendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommend = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      recommend: freezed == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as Recommend?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecommendCopyWith<$Res>? get recommend {
    if (_value.recommend == null) {
      return null;
    }

    return $RecommendCopyWith<$Res>(_value.recommend!, (value) {
      return _then(_value.copyWith(recommend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductRecommendStateCopyWith<$Res>
    implements $ProductRecommendStateCopyWith<$Res> {
  factory _$$_ProductRecommendStateCopyWith(_$_ProductRecommendState value,
          $Res Function(_$_ProductRecommendState) then) =
      __$$_ProductRecommendStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Recommend? recommend, bool isLoading});

  @override
  $RecommendCopyWith<$Res>? get recommend;
}

/// @nodoc
class __$$_ProductRecommendStateCopyWithImpl<$Res>
    extends _$ProductRecommendStateCopyWithImpl<$Res, _$_ProductRecommendState>
    implements _$$_ProductRecommendStateCopyWith<$Res> {
  __$$_ProductRecommendStateCopyWithImpl(_$_ProductRecommendState _value,
      $Res Function(_$_ProductRecommendState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommend = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_ProductRecommendState(
      recommend: freezed == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as Recommend?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProductRecommendState implements _ProductRecommendState {
  _$_ProductRecommendState({this.recommend, this.isLoading = true});

  @override
  final Recommend? recommend;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ProductRecommendState(recommend: $recommend, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductRecommendState &&
            (identical(other.recommend, recommend) ||
                other.recommend == recommend) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recommend, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductRecommendStateCopyWith<_$_ProductRecommendState> get copyWith =>
      __$$_ProductRecommendStateCopyWithImpl<_$_ProductRecommendState>(
          this, _$identity);
}

abstract class _ProductRecommendState implements ProductRecommendState {
  factory _ProductRecommendState(
      {final Recommend? recommend,
      final bool isLoading}) = _$_ProductRecommendState;

  @override
  Recommend? get recommend;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ProductRecommendStateCopyWith<_$_ProductRecommendState> get copyWith =>
      throw _privateConstructorUsedError;
}
