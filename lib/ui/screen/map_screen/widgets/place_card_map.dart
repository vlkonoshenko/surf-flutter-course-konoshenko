import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:places/data/model/place.dart';
import 'package:places/res/icons.dart';
import 'package:places/ui/components/sight_card/widgets/card_image_preview.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

class PlaceCardMap extends StatelessWidget {
  final Place place;

  const PlaceCardMap({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(16),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: () => Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      SightDetailsScreen(sight: place),
                                ),
                              ),
                          child: CardImagePreview(place: place)),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    place.name,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    place.description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  //if (widget.place.wantVisit || widget.place.visited)
                                  //   _buildSightStatus(context),
                                ],
                              ),
                            ),
                            Center(
                              child: InkWell(
                                onTap: () async {
                                  final availableMaps =
                                      await MapLauncher.installedMaps;

                                  await availableMaps.first.showMarker(
                                    coords: Coords(place.lat, place.lng),
                                    title: place.name,
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context).accentColor,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    iconGo,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
