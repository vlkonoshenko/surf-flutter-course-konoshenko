import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/res/colors.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/text_style.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter_screen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<FilterModel> filters = [
    FilterModel(iconHotel, 'Отель', false),
    FilterModel(iconRestourant, 'Ресторан', false),
    FilterModel(iconParticularPlace, 'Особое место', false),
    FilterModel(iconPark, 'Парк', false),
    FilterModel(iconMuseum, 'Музей', false),
    FilterModel(iconCafe, 'Кафе', false),
  ];

  RangeValues valueSlider = RangeValues(100, 10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  filters.forEach((element) {
                    element.isSelected = false;
                  });
                  valueSlider = RangeValues(100, 10000);
                });
              },
              child: Text(
                'Очистить',
                style: TextStyle(color: Theme.of(context).accentColor),
              ))
        ],
        leading: IconButton(
          icon: SvgPicture.asset(iconArrow,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'категории'.toUpperCase(),
                  style: matCaption.copyWith(color: Color(0xff7C7E92)),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: filters.map((e) => FilterContent(e)).toList()),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Расстояние',
                        style:
                            matSubtitle1.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'от ${valueSlider.start.floor()} до ${valueSlider.end.floor()} м',
                        style: matSubtitle1.copyWith(
                            fontWeight: FontWeight.w400,
                            color: lmSecondary2Color),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Theme.of(context).accentColor,
                      thumbColor: Color(0xfff5f5f5),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                      trackHeight: 1,
                    ),
                    child: RangeSlider(
                      min: 100,
                      max: 10000,
                      onChanged: (RangeValues value) {
                        setState(() {
                          valueSlider = value;
                        });
                      },
                      values: valueSlider,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                print('on click iconGo');
              },
              child: Text(
                'Показать (${countPlaceInRange()})'.toUpperCase(),
                style: textButtonElevation,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

  int countPlaceInRange() {
    int result = 0;
    mocks.forEach((element) {
      if (arePointsNear(element.sight.coordinate,
          Coordinate(48.025297, 37.796868), valueSlider)) {
        result++;
      }
    });
    return result;
  }

  bool arePointsNear(
      Coordinate checkPoint, Coordinate centerPoint, RangeValues range) {
    var kmH = range.end / 1000;
    var kmL = range.start / 1000;
    var ky = 40000 / 360;
    var kx = cos(pi * centerPoint.lat / 180.0) * ky;
    var dx = (centerPoint.lng - checkPoint.lng).abs() * kx;
    var dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
    var distance = sqrt(dx * dx + dy * dy);
    var result = distance <= kmH && distance >= kmL;
    return result;
  }
}

class FilterContent extends StatefulWidget {
  final FilterModel filterModel;

  const FilterContent(this.filterModel);

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
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(widget.filterModel.icon,
                          color: Theme.of(context).accentColor),
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
                        color: Theme.of(context).primaryColor),
                    duration: Duration(milliseconds: 200),
                    child: SvgPicture.asset(
                      iconTick,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.filterModel.title,
            style: matCaption,
          ),
        ],
      );
}

class FilterModel {
  String icon;
  String title;
  bool isSelected;

  FilterModel(this.icon, this.title, this.isSelected);
}
