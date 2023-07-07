// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recommend _$$_RecommendFromJson(Map<String, dynamic> json) => _$_Recommend(
      totalSize: json['totalSize'] as int?,
      typeId: json['typeId'] as int?,
      offset: json['offset'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => RecommendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecommendToJson(_$_Recommend instance) =>
    <String, dynamic>{
      'totalSize': instance.totalSize,
      'typeId': instance.typeId,
      'offset': instance.offset,
      'products': instance.products,
    };

_$_RecommendModel _$$_RecommendModelFromJson(Map<String, dynamic> json) =>
    _$_RecommendModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      stars: json['stars'] as int?,
      img: json['img'] as String?,
      location: json['location'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      typeId: json['typeId'] as int?,
    );

Map<String, dynamic> _$$_RecommendModelToJson(_$_RecommendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stars': instance.stars,
      'img': instance.img,
      'location': instance.location,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'typeId': instance.typeId,
    };
