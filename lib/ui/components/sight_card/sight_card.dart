import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/data/model/place.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/favorite/favorites_action.dart';
import 'package:places/res/icons.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

import '../../screen/dismiss_background/dismiss_background.dart';
import 'widgets/card_image_preview.dart';

enum SightCardState { drag, simple }

class SightCard extends StatefulWidget {
  final Place place;
  final VoidCallback onDelete;
  final VoidCallback onVisited;
  final SightCardState sightCardState;

  const SightCard(
    this.place, {
    required this.onDelete,
    required this.onVisited,
    Key? key,
    this.sightCardState = SightCardState.simple,
  }) : super(key: key);

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          const Positioned.fill(
            child: DismissBackground(),
          ),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(16),
            child: Dismissible(
              onDismissed: (value) => widget.onDelete(),
              direction: DismissDirection.endToStart,
              key: ObjectKey(widget.place),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(children: [
                  Column(
                    children: [
                      CardImagePreview(place: widget.place),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              widget.place.name,
                              maxLines: 2,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.place.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            //if (widget.place.wantVisit || widget.place.visited)
                            //   _buildSightStatus(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                SightDetailsScreen(sight: widget.place),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          if (widget.sightCardState == SightCardState.simple)
            Positioned(
              right: 4,
              top: 4,
              child: StoreBuilder<AppState>(
                builder: (context, store) {
                  return IconButton(
                    icon: AnimatedCrossFade(
                      firstChild: SvgPicture.asset(
                        iconHeart,
                        color: Colors.white,
                      ),
                      secondChild: SvgPicture.asset(
                        iconHeartFull,
                        color: Colors.white,
                      ),
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: store.state.favoritesState.result
                              .contains(widget.place)
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                    onPressed: () {
                      store.dispatch(AddToFavoriteAction(widget.place));
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
