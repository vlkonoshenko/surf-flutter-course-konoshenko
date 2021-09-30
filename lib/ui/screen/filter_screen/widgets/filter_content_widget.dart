import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';

final _mapIcon = <String, String>{
  'hotel': iconHotel,
  'restaurant': iconRestourant,
  'other': iconPark,
  'park': iconPark,
  'museum': iconMuseum,
  'cafe': iconCafe,
};

final _mapFilter = <String,String>{
  'hotel':'Отель',
  'restaurant':'Ресторан',
  'other':'Особое',
  'park':'Парк',
  'museum':'Музей',
  'cafe':'Кафе',
};

class FilterContentWidget extends StatefulWidget {
  final String filterModel;
  final VoidCallback onFilterClick;
  final bool isSelected;

  const FilterContentWidget({
    required this.filterModel,
    required this.onFilterClick,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  _FilterContentWidgetState createState() => _FilterContentWidgetState();
}

class _FilterContentWidgetState extends State<FilterContentWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100.0),
                  onTap: widget.onFilterClick,
                  child: Container(
                    height: 64,
                    width: 64,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: lmGreenColor.withOpacity(0.16),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        _mapIcon[widget.filterModel]??'',
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    height: widget.isSelected ? 16 : 0,
                    width: widget.isSelected ? 16 : 0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    duration: const Duration(milliseconds: 200),
                    child: SvgPicture.asset(
                      iconTick,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _mapFilter[widget.filterModel]??'',
            style: Theme.of(context).primaryTextTheme.caption,
          ),
        ],
      );
}
