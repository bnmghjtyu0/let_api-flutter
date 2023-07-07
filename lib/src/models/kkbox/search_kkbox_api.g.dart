// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_kkbox_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchKKBOX _$$_SearchKKBOXFromJson(Map<String, dynamic> json) =>
    _$_SearchKKBOX(
      tracks: json['tracks'] == null
          ? null
          : Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchKKBOXToJson(_$_SearchKKBOX instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
      'paging': instance.paging,
      'summary': instance.summary,
    };
