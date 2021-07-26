import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/filter_screen/model/filter_model.dart';

class FilterContent extends StatefulWidget {
  final FilterModel filterModel;

  const FilterContent(this.filterModel, {Key? key}) : super(key: key);

  @override
  _FilterContentState createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
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
                  onTap: () {
                    setState(() {
                      widget.filterModel.isSelected =
                          !widget.filterModel.isSelected;
                    });
                  },
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
                        widget.filterModel.icon,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    height: widget.filterModel.isSelected ? 16 : 0,
                    width: widget.filterModel.isSelected ? 16 : 0,
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
            widget.filterModel.title,
            style: Theme.of(context).primaryTextTheme.caption,
          ),
        ],
      );
}
