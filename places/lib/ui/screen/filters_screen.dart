import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/res/colors.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/text_style.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const String routeName = '/filter_screen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<FilterModel> filters = [
    FilterModel(iconHotel, 'Отель'),
    FilterModel(iconRestourant, 'Ресторан'),
    FilterModel(iconParticularPlace, 'Особое место'),
    FilterModel(iconPark, 'Парк'),
    FilterModel(iconMuseum, 'Музей'),
    FilterModel(iconCafe, 'Кафе'),
  ];

  RangeValues valueSlider = const RangeValues(100, 10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (final element in filters) {
                  element.isSelected = false;
                }
                valueSlider = const RangeValues(100, 10000);
              });
            },
            child: Text(
              'Очистить',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
        ],
        leading: IconButton(
          icon: SvgPicture.asset(
            iconArrow,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'КАТЕГОРИИ',
                  style: matCaption.copyWith(color: const Color(0xff7C7E92)),
                ),
              ],
            ),
          ),
          MediaQuery.of(context).size.height < 800
              ? SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: filters
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8,
                                top: 16,
                              ),
                              child: FilterContent(e),
                            ))
                        .toList(),
                  ),
                )
              : GridView.count(
            physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: filters.map((e) => FilterContent(e)).toList(),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Расстояние',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'от ${valueSlider.start.floor()} до ${valueSlider.end.floor()} м',
                        style: matSubtitle1.copyWith(
                          fontWeight: FontWeight.w400,
                          color: lmSecondary2Color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xff8d8e98),
                      activeTrackColor: Theme.of(context).accentColor,
                      thumbColor: const Color(0xfff5f5f5),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 0),
                      trackHeight: 1,
                    ),
                    child: RangeSlider(
                      min: 100,
                      max: 10000,
                      onChanged: (value) {
                        setState(() {
                          valueSlider = value;
                        });
                      },
                      values: valueSlider,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                debugPrint('on click iconGo');
              },
              child: FutureBuilder<List<Place>>(
                future: PlaceInteractor().getPlaces(
                  valueSlider,
                  filters.map((e) => e.title).toList(),
                ),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return Text(
                      'Показать (${snap.data!.length})'.toUpperCase(),
                      style: textButtonElevation,
                    );
                  }

                  return Text(
                    'Показать'.toUpperCase(),
                    style: textButtonElevation,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  int countPlaceInRange() {
    int result = 0;

    return result;
  }
}

class FilterContent extends StatefulWidget {
  const FilterContent(this.filterModel, {Key? key}) : super(key: key);

  final FilterModel filterModel;

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

class FilterModel {
  FilterModel(
    this.icon,
    this.title, {
    this.isSelected = false,
  });

  String icon;
  String title;
  bool isSelected;
}
