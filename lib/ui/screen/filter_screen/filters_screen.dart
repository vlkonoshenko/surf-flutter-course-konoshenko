import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/search_filter.dart';
import 'package:places/res/colors.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/text_style.dart';
import 'package:places/service/shared_preference.dart';
import 'package:places/ui/screen/filter_screen/widgets/filter_content_widget.dart';
import 'package:provider/provider.dart';

final _mapFilter = <String, String>{
  'hotel': 'Отель',
  'restaurant': 'Ресторан',
  'other': 'Особое',
  'park': 'Парк',
  'museum': 'Музей',
  'cafe': 'Кафе',
};

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filter_screen';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<String> selectedFilers = [];

  RangeValues valueSlider = const RangeValues(100, 10000);

  @override
  void initState() {
    super.initState();

    SharedPreference.getSearchFilter().then((value) {
      setState(() {
        valueSlider = RangeValues(value.startPoint, value.endPoint);
        selectedFilers = value.categories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedFilers.clear();
                valueSlider = const RangeValues(100, 10000);
              });
            },
            child: Text(
              'Очистить',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
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
          if (MediaQuery.of(context).size.height < 600)
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _mapFilter.keys
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 16,
                          ),
                          child: FilterContentWidget(
                            filterModel: e,
                            onFilterClick: () {
                              setState(() {
                                if (selectedFilers.contains(e)) {
                                  selectedFilers.remove(e);
                                } else {
                                  selectedFilers.add(e);
                                }
                              });
                            },
                            isSelected: selectedFilers.contains(e),
                          ),
                        ))
                    .toList(),
              ),
            )
          else
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: _mapFilter.keys
                  .map((e) => FilterContentWidget(
                        filterModel: e,
                        onFilterClick: () {
                          setState(() {
                            selectedFilers.contains(e)
                                ? selectedFilers.remove(e)
                                : selectedFilers.add(e);
                          });
                        },
                        isSelected: selectedFilers.contains(e),
                      ))
                  .toList(),
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
                SharedPreference.setSearchFilter(SearchFilter(
                  selectedFilers,
                  valueSlider.start,
                  valueSlider.end,
                ));
              },
              child: FutureBuilder<List<Place>>(
                future: context.read<PlaceInteractor>().getPlaces(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    final data = snap.data
                            ?.where((element) =>
                                selectedFilers.contains(element.placeType))
                            .toList();

                    return Text(
                      'Показать (${data?.length})'.toUpperCase(),
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
    const result = 0;

    return result;
  }
}
