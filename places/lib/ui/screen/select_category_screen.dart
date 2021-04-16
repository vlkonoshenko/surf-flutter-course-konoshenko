import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/text_style.dart';

class SelectCategoryScreen extends StatefulWidget {
  static const String routeName = '/select_category_screen';

  @override
  _SelectCategoryScreenState createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  SightCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Категория",
            style: Theme.of(context)
                .primaryTextTheme
                .subtitle1
                .copyWith(fontSize: 18),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = SightCategory.values[index];
                      });
                    },
                    child: ListTile(
                      title: Text(SightCategory.values[index].toText()),
                      trailing: selectedCategory == SightCategory.values[index]
                          ? SvgPicture.asset(
                              iconTick,
                              color: Colors.green,
                            )
                          : SizedBox.shrink(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      height: 0.5,
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                      thickness: 0.5,
                    ),
                  );
                },
                itemCount: SightCategory.values.length),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: selectedCategory != null
                  ? () {
                      Navigator.pop<SightCategory>(context, selectedCategory);
                    }
                  : null,
              child: Text(
                'Сохранить'.toUpperCase(),
                style: textButtonElevation,
              ),
            ),
          ),
        ]));
  }
}

enum SightCategory {
  hotel,
  restaurant,
  special_place,
  park,
  museum,
  cafe,
}

extension SightCategoryExt on SightCategory {
  String toText() {
    switch (this) {
      case SightCategory.hotel:
        return 'Отель';
        break;
      case SightCategory.restaurant:
        return 'Ресторан';
        break;
      case SightCategory.special_place:
        return 'Особое место';
        break;
      case SightCategory.park:
        return 'Парк';
        break;
      case SightCategory.museum:
        return 'Музей';
        break;
      case SightCategory.cafe:
        return 'Кафе';
        break;
    }
  }
}
