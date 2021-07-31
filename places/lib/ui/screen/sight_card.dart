import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/data/model/place.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

enum SightCardState { drag, simple }

class SightCard extends StatefulWidget {
  final Place place;
  final VoidCallback onDelete;
  final SightCardState sightCardState;

  const SightCard(
    this.place, {
    required this.onDelete,
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
            child: _DismissBackground(),
          ),
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
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Center(
                                child: CupertinoActivityIndicator
                                    .partiallyRevealed(
                                  progress: loadingProgress
                                              .expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
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
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.place.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).primaryTextTheme.bodyText1,
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
                        builder: (_) => SightDetailsScreen(sight: widget.place),
                      ),
                    ),
                  ),
                ),
                // if (widget.sightCardState == SightCardState.simple)
                //   Positioned(
                //     right: 16,
                //     top: 16,
                //     child: SightCardTools(
                //       widget.place,
                //       onDelete: widget.onDelete,
                //     ),
                //   ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

// Widget _buildSightStatus(BuildContext context) {
//   return Expanded(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         const SizedBox(height: 2),
//         Text(
//           'закрыто до 09:00',
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: Theme.of(context)
//               .primaryTextTheme
//               .bodyText1
//               .copyWith(color: lmSecondary2Color),
//         ),
//         const SizedBox(height: 12),
//       ],
//     ),
//   );
// }

// Widget _buildDetailInfo(BuildContext context, Place place) {
//   // if (sightMeta.visited) {
//   //   return Text(
//   //     'Цель достигнута 12 окт. 2020',
//   //     maxLines: 1,
//   //     overflow: TextOverflow.ellipsis,
//   //     style: Theme.of(context).primaryTextTheme.bodyText1,
//   //   );
//   // }
//   // if (sightMeta.wantVisit) {
//   //   return Text(
//   //     'Запланировано на 12 окт. 2020',
//   //     maxLines: 1,
//   //     overflow: TextOverflow.ellipsis,
//   //     style: Theme.of(context)
//   //         .primaryTextTheme
//   //         .bodyText1
//   //         .copyWith(color: lmGreenColor),
//   //   );
//   // }
//
//   return Text(
//     widget.place.description,
//     maxLines: 1,
//     overflow: TextOverflow.ellipsis,
//     style: Theme.of(context).primaryTextTheme.bodyText1,
//   );
// }
}

class _DismissBackground extends StatelessWidget {
  const _DismissBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: lmRedColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconBucket,
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 8),
            Text(
              'Удалить',
              style: Theme.of(context)
                  .primaryTextTheme
                  .caption!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// class SightCardTools extends StatelessWidget {
//   const SightCardTools(this.sightMeta, {this.onDelete, Key key})
//       : super(key: key);
//
//   final SightCardMeta sightMeta;
//   final VoidCallback onDelete;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (sightMeta.visited)
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: _BtnToolIcon(
//               icon: iconShare,
//               onClick: () {
//                 //print('on click iconShare');
//               },
//             ),
//           ),
//         if (sightMeta.wantVisit)
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: _BtnToolIcon(
//               icon: iconCalendar,
//               onClick: () {
//                 //print('on click iconCalendar');
//               },
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.only(left: 16.0),
//           child: (sightMeta.visited || sightMeta.wantVisit)
//               ? _BtnToolIcon(icon: iconClose, onClick: onDelete)
//               : _BtnToolIcon(
//                   icon: iconHeart,
//                   onClick: () {
//                     //print('on click iconShare');
//                   },
//                 ),
//         ),
//       ],
//     );
//   }
// }

// class _BtnToolIcon extends StatelessWidget {
//   final VoidCallback onClick;
//   final String icon;
//
//   const _BtnToolIcon({
//     required this.icon,
//     required this.onClick,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(100),
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(100),
//         onTap: onClick,
//         child: SvgPicture.asset(icon),
//       ),
//     );
//   }
// }
