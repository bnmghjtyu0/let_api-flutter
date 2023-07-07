// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChartsKKBOXResponse _$ChartsKKBOXResponseFromJson(Map<String, dynamic> json) {
  return _ChartsKKBOXResponse.fromJson(json);
}

/// @nodoc
mixin _$ChartsKKBOXResponse {
  List<Data>? get data => throw _privateConstructorUsedError;
  Paging? get paging => throw _privateConstructorUsedError;
  Summary? get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartsKKBOXResponseCopyWith<ChartsKKBOXResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartsKKBOXResponseCopyWith<$Res> {
  factory $ChartsKKBOXResponseCopyWith(
          ChartsKKBOXResponse value, $Res Function(ChartsKKBOXResponse) then) =
      _$ChartsKKBOXResponseCopyWithImpl<$Res, ChartsKKBOXResponse>;
  @useResult
  $Res call({List<Data>? data, Paging? paging, Summary? summary});

  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$ChartsKKBOXResponseCopyWithImpl<$Res, $Val extends ChartsKKBOXResponse>
    implements $ChartsKKBOXResponseCopyWith<$Res> {
  _$ChartsKKBOXResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? paging = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
      paging: freezed == paging
          ? _value.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as Paging?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $SummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChartsKKBOXResponseCopyWith<$Res>
    implements $ChartsKKBOXResponseCopyWith<$Res> {
  factory _$$_ChartsKKBOXResponseCopyWith(_$_ChartsKKBOXResponse value,
          $Res Function(_$_ChartsKKBOXResponse) then) =
      __$$_ChartsKKBOXResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Data>? data, Paging? paging, Summary? summary});

  @override
  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$_ChartsKKBOXResponseCopyWithImpl<$Res>
    extends _$ChartsKKBOXResponseCopyWithImpl<$Res, _$_ChartsKKBOXResponse>
    implements _$$_ChartsKKBOXResponseCopyWith<$Res> {
  __$$_ChartsKKBOXResponseCopyWithImpl(_$_ChartsKKBOXResponse _value,
      $Res Function(_$_ChartsKKBOXResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? paging = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$_ChartsKKBOXResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
      paging: freezed == paging
          ? _value.paging
          : paging // ignore: cast_nullable_to_non_nullable
              as Paging?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Summary?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChartsKKBOXResponse implements _ChartsKKBOXResponse {
  const _$_ChartsKKBOXResponse(
      {final List<Data>? data, this.paging, this.summary})
      : _data = data;

  factory _$_ChartsKKBOXResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChartsKKBOXResponseFromJson(json);

  final List<Data>? _data;
  @override
  List<Data>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Paging? paging;
  @override
  final Summary? summary;

  @override
  String toString() {
    return 'ChartsKKBOXResponse(data: $data, paging: $paging, summary: $summary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChartsKKBOXResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.paging, paging) || other.paging == paging) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), paging, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChartsKKBOXResponseCopyWith<_$_ChartsKKBOXResponse> get copyWith =>
      __$$_ChartsKKBOXResponseCopyWithImpl<_$_ChartsKKBOXResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChartsKKBOXResponseToJson(
      this,
    );
  }
}

abstract class _ChartsKKBOXResponse implements ChartsKKBOXResponse {
  const factory _ChartsKKBOXResponse(
      {final List<Data>? data,
      final Paging? paging,
      final Summary? summary}) = _$_ChartsKKBOXResponse;

  factory _ChartsKKBOXResponse.fromJson(Map<String, dynamic> json) =
      _$_ChartsKKBOXResponse.fromJson;

  @override
  List<Data>? get data;
  @override
  Paging? get paging;
  @override
  Summary? get summary;
  @override
  @JsonKey(ignore: true)
  _$$_ChartsKKBOXResponseCopyWith<_$_ChartsKKBOXResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
