import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

import 'dismiss_background/dismiss_background.dart';

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
              onDismissed: (value) {
                widget.onDelete();
              },
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
                      SizedBox(
                        height: 96,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              widget.place.urls.isNotEmpty
                                  ? widget.place.urls.first
                                  : '',
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;

                                return Center(
                                  child: CupertinoActivityIndicator
                                      .partiallyRevealed(
                                    progress: loadingProgress
                                                .expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : 0.0,
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              left: 16,
                              top: 16,
                              child: Text(
                                widget.place.placeType,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                        onTap: () => showModalBottomSheet<void>(
                          context: context,
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          isScrollControlled: true,
                          builder: (_) =>
                              SightDetailsScreen(sight: widget.place),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
