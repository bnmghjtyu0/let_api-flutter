// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recommend _$RecommendFromJson(Map<String, dynamic> json) {
  return _Recommend.fromJson(json);
}

/// @nodoc
mixin _$Recommend {
  int? get totalSize => throw _privateConstructorUsedError;
  int? get typeId => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  List<RecommendModel>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendCopyWith<Recommend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendCopyWith<$Res> {
  factory $RecommendCopyWith(Recommend value, $Res Function(Recommend) then) =
      _$RecommendCopyWithImpl<$Res, Recommend>;
  @useResult
  $Res call(
      {int? totalSize,
      int? typeId,
      int? offset,
      List<RecommendModel>? products});
}

/// @nodoc
class _$RecommendCopyWithImpl<$Res, $Val extends Recommend>
    implements $RecommendCopyWith<$Res> {
  _$RecommendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSize = freezed,
    Object? typeId = freezed,
    Object? offset = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      totalSize: freezed == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<RecommendModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecommendCopyWith<$Res> implements $RecommendCopyWith<$Res> {
  factory _$$_RecommendCopyWith(
          _$_Recommend value, $Res Function(_$_Recommend) then) =
      __$$_RecommendCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalSize,
      int? typeId,
      int? offset,
      List<RecommendModel>? products});
}

/// @nodoc
class __$$_RecommendCopyWithImpl<$Res>
    extends _$RecommendCopyWithImpl<$Res, _$_Recommend>
    implements _$$_RecommendCopyWith<$Res> {
  __$$_RecommendCopyWithImpl(
      _$_Recommend _value, $Res Function(_$_Recommend) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSize = freezed,
    Object? typeId = freezed,
    Object? offset = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_Recommend(
      totalSize: freezed == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<RecommendModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recommend implements _Recommend {
  const _$_Recommend(
      {this.totalSize,
      this.typeId,
      this.offset,
      final List<RecommendModel>? products})
      : _products = products;

  factory _$_Recommend.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendFromJson(json);

  @override
  final int? totalSize;
  @override
  final int? typeId;
  @override
  final int? offset;
  final List<RecommendModel>? _products;
  @override
  List<RecommendModel>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recommend(totalSize: $totalSize, typeId: $typeId, offset: $offset, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recommend &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalSize, typeId, offset,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecommendCopyWith<_$_Recommend> get copyWith =>
      __$$_RecommendCopyWithImpl<_$_Recommend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendToJson(
      this,
    );
  }
}

abstract class _Recommend implements Recommend {
  const factory _Recommend(
      {final int? totalSize,
      final int? typeId,
      final int? offset,
      final List<RecommendModel>? products}) = _$_Recommend;

  factory _Recommend.fromJson(Map<String, dynamic> json) =
      _$_Recommend.fromJson;

  @override
  int? get totalSize;
  @override
  int? get typeId;
  @override
  int? get offset;
  @override
  List<RecommendModel>? get products;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendCopyWith<_$_Recommend> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendModel _$RecommendModelFromJson(Map<String, dynamic> json) {
  return _RecommendModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get stars => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get typeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendModelCopyWith<RecommendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendModelCopyWith<$Res> {
  factory $RecommendModelCopyWith(
          RecommendModel value, $Res Function(RecommendModel) then) =
      _$RecommendModelCopyWithImpl<$Res, RecommendModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? price,
      int? stars,
      String? img,
      String? location,
      String? createdAt,
      String? updatedAt,
      int? typeId});
}

/// @nodoc
class _$RecommendModelCopyWithImpl<$Res, $Val extends RecommendModel>
    implements $RecommendModelCopyWith<$Res> {
  _$RecommendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? stars = freezed,
    Object? img = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? typeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      stars: freezed == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecommendModelCopyWith<$Res>
    implements $RecommendModelCopyWith<$Res> {
  factory _$$_RecommendModelCopyWith(
          _$_RecommendModel value, $Res Function(_$_RecommendModel) then) =
      __$$_RecommendModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? price,
      int? stars,
      String? img,
      String? location,
      String? createdAt,
      String? updatedAt,
      int? typeId});
}

/// @nodoc
class __$$_RecommendModelCopyWithImpl<$Res>
    extends _$RecommendModelCopyWithImpl<$Res, _$_RecommendModel>
    implements _$$_RecommendModelCopyWith<$Res> {
  __$$_RecommendModelCopyWithImpl(
      _$_RecommendModel _value, $Res Function(_$_RecommendModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? stars = freezed,
    Object? img = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? typeId = freezed,
  }) {
    return _then(_$_RecommendModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      stars: freezed == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecommendModel implements _RecommendModel {
  const _$_RecommendModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  factory _$_RecommendModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? price;
  @override
  final int? stars;
  @override
  final String? img;
  @override
  final String? location;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? typeId;

  @override
  String toString() {
    return 'RecommendModel(id: $id, name: $name, description: $description, price: $price, stars: $stars, img: $img, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, typeId: $typeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.typeId, typeId) || other.typeId == typeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, price,
      stars, img, location, createdAt, updatedAt, typeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecommendModelCopyWith<_$_RecommendModel> get copyWith =>
      __$$_RecommendModelCopyWithImpl<_$_RecommendModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendModelToJson(
      this,
    );
  }
}

abstract class _RecommendModel implements RecommendModel {
  const factory _RecommendModel(
      {final int? id,
      final String? name,
      final String? description,
      final int? price,
      final int? stars,
      final String? img,
      final String? location,
      final String? createdAt,
      final String? updatedAt,
      final int? typeId}) = _$_RecommendModel;

  factory _RecommendModel.fromJson(Map<String, dynamic> json) =
      _$_RecommendModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  int? get price;
  @override
  int? get stars;
  @override
  String? get img;
  @override
  String? get location;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get typeId;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendModelCopyWith<_$_RecommendModel> get copyWith =>
      throw _privateConstructorUsedError;
}
