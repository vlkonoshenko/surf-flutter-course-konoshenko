import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/components/components.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({Key key}) : super(key: key);
  static const String routeName = '/sight_details_screen';

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final SightCardMeta sight =
        ModalRoute.of(context).settings.arguments as SightCardMeta;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0.0,
              left: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      sight.sight.url,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CupertinoActivityIndicator.partiallyRevealed(
                            progress: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
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
                              sight.sight.name,
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  sight.sight.type.toText(),
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle2
                                      .copyWith(color: const Color(0xff7C7E92)),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'закрыто до 09:00',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              sight.sight.details,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            //print('on click iconGo');
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
                        Row(
                          children: [
                            Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    //print('on click iconCalendar');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        iconCalendar,
                                        color:
                                            lmSecondary2Color.withOpacity(0.56),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('Запланировать',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: lmSecondary2Color
                                                      .withOpacity(0.56)))
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    //print('on click iconHeart');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        iconHeart,
                                        color:
                                            lmSecondary2Color.withOpacity(0.56),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('В Избранное',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(),
          ),
        ],
      ),
    );
  }
}
