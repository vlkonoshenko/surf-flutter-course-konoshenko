import 'package:places/ui/screen/select_category_screen.dart';

class Sight {
  String name;
  List<String> url;
  Coordinate coordinate;
  String details;

  SightCategory type;

  Sight(
    this.name,
    this.url,
    this.coordinate,
    this.details,
    this.type,
  );
}

class Coordinate {
  Coordinate(
    this.lat,
    this.lng,
  );

  double lat;
  double lng;
}
