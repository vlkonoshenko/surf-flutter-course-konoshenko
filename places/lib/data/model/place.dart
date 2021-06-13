class Place {
  int id;
  double lat;
  double lng;
  String name;
  List<String> urls;
  String placeType;
  String description;

  Place({
    this.id,
    this.lat,
    this.lng,
    this.name,
    this.urls,
    this.placeType,
    this.description,
  });

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    lat = json['lat'] as double;
    lng = json['lng'] as double;
    name = json['name'] as String;
    urls = (json['urls'] as List<dynamic>).cast<String>();
    placeType = json['placeType'] as String;
    description = json['description'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lat'] = lat;
    data['lng'] = lng;
    data['name'] = name;
    data['urls'] = urls;
    data['placeType'] = placeType;
    data['description'] = description;

    return data;
  }
}
