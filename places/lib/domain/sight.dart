import 'package:places/ui/screen/select_category_screen.dart';

class Sight {
  String name;
  String url;
  Coordinate coordinate;
  String details;
  SightCategory type;

  Sight(this.name, this.url, this.coordinate, this.details, this.type);
}

class Coordinate {
  double lat;
  double lng;

  Coordinate(this.lat, this.lng);
}
