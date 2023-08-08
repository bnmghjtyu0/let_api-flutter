// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_kkbox_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchKKBOX _$SearchKKBOXFromJson(Map<String, dynamic> json) {
  return _SearchKKBOX.fromJson(json);
}

/// @nodoc
mixin _$SearchKKBOX {
  Tracks? get tracks => throw _privateConstructorUsedError;
  Paging? get paging => throw _privateConstructorUsedError;
  Summary? get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchKKBOXCopyWith<SearchKKBOX> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchKKBOXCopyWith<$Res> {
  factory $SearchKKBOXCopyWith(
          SearchKKBOX value, $Res Function(SearchKKBOX) then) =
      _$SearchKKBOXCopyWithImpl<$Res, SearchKKBOX>;
  @useResult
  $Res call({Tracks? tracks, Paging? paging, Summary? summary});

  $TracksCopyWith<$Res>? get tracks;
  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$SearchKKBOXCopyWithImpl<$Res, $Val extends SearchKKBOX>
    implements $SearchKKBOXCopyWith<$Res> {
  _$SearchKKBOXCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = freezed,
    Object? paging = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      tracks: freezed == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks?,
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
  $TracksCopyWith<$Res>? get tracks {
    if (_value.tracks == null) {
      return null;
    }

    return $TracksCopyWith<$Res>(_value.tracks!, (value) {
      return _then(_value.copyWith(tracks: value) as $Val);
    });
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
abstract class _$$_SearchKKBOXCopyWith<$Res>
    implements $SearchKKBOXCopyWith<$Res> {
  factory _$$_SearchKKBOXCopyWith(
          _$_SearchKKBOX value, $Res Function(_$_SearchKKBOX) then) =
      __$$_SearchKKBOXCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tracks? tracks, Paging? paging, Summary? summary});

  @override
  $TracksCopyWith<$Res>? get tracks;
  @override
  $SummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$_SearchKKBOXCopyWithImpl<$Res>
    extends _$SearchKKBOXCopyWithImpl<$Res, _$_SearchKKBOX>
    implements _$$_SearchKKBOXCopyWith<$Res> {
  __$$_SearchKKBOXCopyWithImpl(
      _$_SearchKKBOX _value, $Res Function(_$_SearchKKBOX) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = freezed,
    Object? paging = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$_SearchKKBOX(
      tracks: freezed == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks?,
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
class _$_SearchKKBOX implements _SearchKKBOX {
  const _$_SearchKKBOX({this.tracks, this.paging, this.summary});

  factory _$_SearchKKBOX.fromJson(Map<String, dynamic> json) =>
      _$$_SearchKKBOXFromJson(json);

  @override
  final Tracks? tracks;
  @override
  final Paging? paging;
  @override
  final Summary? summary;

  @override
  String toString() {
    return 'SearchKKBOX(tracks: $tracks, paging: $paging, summary: $summary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchKKBOX &&
            (identical(other.tracks, tracks) || other.tracks == tracks) &&
            (identical(other.paging, paging) || other.paging == paging) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tracks, paging, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchKKBOXCopyWith<_$_SearchKKBOX> get copyWith =>
      __$$_SearchKKBOXCopyWithImpl<_$_SearchKKBOX>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchKKBOXToJson(
      this,
    );
  }
}

abstract class _SearchKKBOX implements SearchKKBOX {
  const factory _SearchKKBOX(
      {final Tracks? tracks,
      final Paging? paging,
      final Summary? summary}) = _$_SearchKKBOX;

  factory _SearchKKBOX.fromJson(Map<String, dynamic> json) =
      _$_SearchKKBOX.fromJson;

  @override
  Tracks? get tracks;
  @override
  Paging? get paging;
  @override
  Summary? get summary;
  @override
  @JsonKey(ignore: true)
  _$$_SearchKKBOXCopyWith<_$_SearchKKBOX> get copyWith =>
      throw _privateConstructorUsedError;
}
