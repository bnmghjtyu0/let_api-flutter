class ChartsKKBOXResponse {
  List<Data>? data;
  Paging? paging;
  Summary? summary;

  ChartsKKBOXResponse({this.data, this.paging, this.summary});

  ChartsKKBOXResponse.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  String? url;
  List<Images>? images;
  String? updatedAt;
  Owner? owner;

  Data(
      {this.id,
      this.title,
      this.description,
      this.url,
      this.images,
      this.updatedAt,
      this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = updatedAt;
    if (owner != null) {
      data['owner'] = owner!.toJson();
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

class Owner {
  String? id;
  String? url;
  String? name;
  String? description;
  List<Images>? images;

  Owner({this.id, this.url, this.name, this.description, this.images});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    description = json['description'];
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
    data['url'] = url;
    data['name'] = name;
    data['description'] = description;
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
  void next;

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
