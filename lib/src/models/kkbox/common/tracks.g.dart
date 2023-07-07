// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tracks _$$_TracksFromJson(Map<String, dynamic> json) => _$_Tracks(
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

Map<String, dynamic> _$$_TracksToJson(_$_Tracks instance) => <String, dynamic>{
      'data': instance.data,
      'paging': instance.paging,
      'summary': instance.summary,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      id: json['id'] as String?,
      name: json['name'] as String?,
      duration: json['duration'] as int?,
      src: json['src'] as String?,
      url: json['url'] as String?,
      trackNumber: json['trackNumber'] as int?,
      explicitness: json['explicitness'] as bool?,
      availableTerritories: (json['availableTerritories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'src': instance.src,
      'url': instance.url,
      'trackNumber': instance.trackNumber,
      'explicitness': instance.explicitness,
      'availableTerritories': instance.availableTerritories,
      'album': instance.album,
    };

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      explicitness: json['explicitness'] as bool?,
      availableTerritories: (json['availableTerritories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      releaseDate: json['releaseDate'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'explicitness': instance.explicitness,
      'availableTerritories': instance.availableTerritories,
      'releaseDate': instance.releaseDate,
      'images': instance.images,
      'artist': instance.artist,
    };

_$_Images _$$_ImagesFromJson(Map<String, dynamic> json) => _$_Images(
      height: json['height'] as int?,
      width: json['width'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_ImagesToJson(_$_Images instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
    };

_$_Artist _$$_ArtistFromJson(Map<String, dynamic> json) => _$_Artist(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArtistToJson(_$_Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'images': instance.images,
    };

_$_Summary _$$_SummaryFromJson(Map<String, dynamic> json) => _$_Summary(
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_SummaryToJson(_$_Summary instance) =>
    <String, dynamic>{
      'total': instance.total,
    };
