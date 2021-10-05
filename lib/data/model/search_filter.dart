import 'package:flutter/cupertino.dart';

@immutable
class SearchFilter {
  final List<String> categories;
  final double startPoint;
  final double endPoint;

  const SearchFilter(this.categories, this.startPoint, this.endPoint);
}
