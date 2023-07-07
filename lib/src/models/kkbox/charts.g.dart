// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChartsKKBOXResponse _$$_ChartsKKBOXResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChartsKKBOXResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChartsKKBOXResponseToJson(
        _$_ChartsKKBOXResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'paging': instance.paging,
      'summary': instance.summary,
    };
