import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/components/components.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightDetailsScreen extends StatefulWidget {
  static const String routeName = '/sight_details_screen';

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final SightCardMeta sight = ModalRoute.of(context).settings.arguments;
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
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  sight.sight.type.toLowerCase(),
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle2.copyWith(color: Color(0xff7C7E92)),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'закрыто до 09:00',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .caption,
                                )
                              ],
                            ),
                            SizedBox(height: 24),
                            ConstrainedBox(
                              constraints: BoxConstraints(minHeight: 100),
                              child: Text(
                                sight.sight.details,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 24),
                        BtnRaised(),
                        SizedBox(height: 24),
                        Divider(),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: BtnSecondary(
                                  title: 'Запланировать',
                                )),
                            Expanded(
                                flex: 1,
                                child: BtnSecondary(
                                  title: 'В Избранное',
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
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
