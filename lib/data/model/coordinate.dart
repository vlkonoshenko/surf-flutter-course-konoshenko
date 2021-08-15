import 'package:flutter/cupertino.dart';

@immutable
class Coordinate {
  final double lat;
  final double lng;

  const Coordinate(this.lat, this.lng);
}
