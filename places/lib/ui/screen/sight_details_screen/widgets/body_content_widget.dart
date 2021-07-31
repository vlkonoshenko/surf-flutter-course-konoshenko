import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/data/model/place.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/bottom_control_panel.dart';

class BodyContent extends StatelessWidget {
  final Place sight;

  const BodyContent(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sight.name,
                style: Theme.of(context).primaryTextTheme.headline5,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    sight.placeType,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle2!
                        .copyWith(color: const Color(0xff7C7E92)),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'закрыто до 09:00',
                    style: Theme.of(context).primaryTextTheme.caption,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                sight.description,
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              return;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconGo,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Построить маршрут'.toUpperCase(),
                  style: textButtonElevation,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 8),
          BottomControlPanel(sight),
        ],
      ),
    );
  }
}
