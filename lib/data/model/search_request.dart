import 'package:flutter/foundation.dart';

@immutable
class SearchRequest {
  final int id;
  final String request;

  const SearchRequest(this.id, this.request);
}
