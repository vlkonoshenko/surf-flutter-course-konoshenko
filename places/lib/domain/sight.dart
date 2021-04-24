import 'package:places/ui/screen/select_category_screen.dart';

class Sight {
  Sight(
    this.name,
    this.url,
    this.coordinate,
    this.details,
    this.type,
  );

  String name;
  String url;
  Coordinate coordinate;
  String details;

  SightCategory type;
}

class Coordinate {
  Coordinate(
    this.lat,
    this.lng,
  );

  double lat;
  double lng;
}
