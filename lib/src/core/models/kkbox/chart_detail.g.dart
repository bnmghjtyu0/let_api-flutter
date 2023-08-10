// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChartDetailResponse _$$_ChartDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChartDetailResponse(
      tracks: json['tracks'] == null
          ? null
          : Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChartDetailResponseToJson(
        _$_ChartDetailResponse instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'images': instance.images,
      'updatedAt': instance.updatedAt,
      'owner': instance.owner,
    };

_$_Owner _$$_OwnerFromJson(Map<String, dynamic> json) => _$_Owner(
      id: json['id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
    };
