import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracks.freezed.dart';
part 'tracks.g.dart';

@freezed
class Tracks with _$Tracks {
  const factory Tracks({
    List<Data>? data,
    Paging? paging,
    Summary? summary,
  }) = _Tracks;

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data(
      {String? id,
      String? name,
      int? duration,
      String? src,
      String? url,
      int? trackNumber,
      bool? explicitness,
      List<String>? availableTerritories,
      Album? album}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Album with _$Album {
  const factory Album({
    String? id,
    String? name,
    String? url,
    bool? explicitness,
    List<String>? availableTerritories,
    String? releaseDate,
    List<Images>? images,
    Artist? artist,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({int? height, int? width, String? url}) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
class Artist with _$Artist {
  const factory Artist({
    String? id,
    String? name,
    String? url,
    List<Images>? images,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

class Paging {
  int? offset;
  int? limit;
  void previous;
  String? next;

  Paging({this.offset, this.limit, this.previous, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    previous = json['previous'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['previous'] = () {};
    data['next'] = next;
    return data;
  }
}

@freezed
class Summary with _$Summary {
  const factory Summary({int? total}) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
