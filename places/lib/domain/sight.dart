class Sight{
  String name;
  String url;
  Coordinate coordinate;
  String details;
  String type;

  Sight(this.name, this.url, this.coordinate, this.details, this.type);
}

class Coordinate {
  double lat;
  double lng;

  Coordinate(this.lat, this.lng);
}
