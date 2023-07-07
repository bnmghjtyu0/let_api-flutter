
class SearchKKBOX {
  Tracks? tracks;
  Paging? paging;
  Summary? summary;

  SearchKKBOX({this.tracks, this.paging, this.summary});

  SearchKKBOX.fromJson(Map<String, dynamic> json) {
    tracks =
        json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null;
    paging =
        json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tracks != null) {
      data['tracks'] = tracks!.toJson();
    }
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
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
        data!.add(Data.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
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
    album = json['album'] != null ? Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['isrc'] = isrc;
    data['url'] = url;
    data['track_number'] = trackNumber;
    data['explicitness'] = explicitness;
    data['available_territories'] = availableTerritories;
    if (album != null) {
      data['album'] = album!.toJson();
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
        images!.add(Images.fromJson(v));
      });
    }
    artist =
        json['artist'] != null ? Artist.fromJson(json['artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['explicitness'] = explicitness;
    data['available_territories'] = availableTerritories;
    data['release_date'] = releaseDate;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (artist != null) {
      data['artist'] = artist!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    data['url'] = url;
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
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
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
    data['previous'] = previous;
    data['next'] = next;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}
