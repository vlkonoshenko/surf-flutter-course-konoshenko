class FilterModel {
  final String icon;
  final String title;
  bool isSelected;

  FilterModel(
    this.icon,
    this.title, {
    this.isSelected = false,
  });
}
