class SearchModel {
  int? count;
  int? offset;
  String? pageBy;
  String? pageAfter;
  String? pagePrior;
  List<String>? sortBy;

  SearchModel({
    this.count,
    this.offset,
    this.pageBy,
    this.pageAfter,
    this.pagePrior,
    this.sortBy,
  });
}
