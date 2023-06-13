import 'dart:convert';

class SearchKKBOX {
  Tracks? tracks;
  Paging? paging;
  Summary? summary;

  SearchKKBOX({this.tracks, this.paging, this.summary});

  SearchKKBOX.fromJson(Map<String, dynamic> json) {
    tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Tracks {
  List<Data>? data;
  Paging? paging;
  Summary? summary;

  Tracks({this.data, this.paging, this.summary});

  Tracks.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  int? duration;
  String? isrc;
  String? url;
  int? trackNumber;
  bool? explicitness;
  List<String>? availableTerritories;
  Album? album;

  Data(
      {this.id,
      this.name,
      this.duration,
      this.isrc,
      this.url,
      this.trackNumber,
      this.explicitness,
      this.availableTerritories,
      this.album});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    isrc = json['isrc'];
    url = json['url'];
    trackNumber = json['track_number'];
    explicitness = json['explicitness'];
    availableTerritories = json['available_territories'].cast<String>();
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['isrc'] = this.isrc;
    data['url'] = this.url;
    data['track_number'] = this.trackNumber;
    data['explicitness'] = this.explicitness;
    data['available_territories'] = this.availableTerritories;
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    return data;
  }
}

class Album {
  String? id;
  String? name;
  String? url;
  bool? explicitness;
  List<String>? availableTerritories;
  String? releaseDate;
  List<Images>? images;
  Artist? artist;

  Album(
      {this.id,
      this.name,
      this.url,
      this.explicitness,
      this.availableTerritories,
      this.releaseDate,
      this.images,
      this.artist});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    explicitness = json['explicitness'];
    availableTerritories = json['available_territories'].cast<String>();
    releaseDate = json['release_date'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['explicitness'] = this.explicitness;
    data['available_territories'] = this.availableTerritories;
    data['release_date'] = this.releaseDate;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }
    return data;
  }
}

class Images {
  int? height;
  int? width;
  String? url;

  Images({this.height, this.width, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    data['url'] = this.url;
    return data;
  }
}

class Artist {
  String? id;
  String? name;
  String? url;
  List<Images>? images;

  Artist({this.id, this.name, this.url, this.images});

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paging {
  int? offset;
  int? limit;
  Null? previous;
  String? next;

  Paging({this.offset, this.limit, this.previous, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    previous = json['previous'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['previous'] = this.previous;
    data['next'] = this.next;
    return data;
  }
}

class Summary {
  int? total;

  Summary({this.total});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
