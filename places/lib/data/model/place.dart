import 'package:flutter/material.dart';

@immutable
class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;

  const Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  Place.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        lat = json['lat'] as double,
        lng = json['lng'] as double,
        name = json['name'] as String,
        urls = (json['urls'] as List<dynamic>).cast<String>(),
        placeType = json['placeType'] as String,
        description = json['description'] as String;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
