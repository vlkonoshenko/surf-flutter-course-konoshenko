import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

class SightCardMeta {
  SightCardMeta(this.sight, {this.wantVisit = false, this.visited = false});

  Sight sight;
  bool wantVisit;
  bool visited;

  SightCardMeta copyWith({bool wantVisit, bool visited}) {
    return SightCardMeta(
      sight,
      wantVisit: wantVisit ?? this.wantVisit,
      visited: visited ?? this.visited,
    );
  }
}

enum SightCardState { drag, simple }

class SightCard extends StatefulWidget {
  const SightCard(this.sightMeta,
      {Key key, this.onDelete, this.sightCardState = SightCardState.simple})
      : super(key: key);

  final SightCardMeta sightMeta;
  final VoidCallback onDelete;
  final SightCardState sightCardState;

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: _cardSight(context),
    );
  }

  Widget _cardSight(BuildContext context) {
    final isDismissed = widget.sightMeta.visited || widget.sightMeta.wantVisit;
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: _buildDismissBackground(context),
        ),
        isDismissed
            ? Dismissible(
                onDismissed: (value) {
                  widget.onDelete();
                },
                direction: DismissDirection.endToStart,
                key: ObjectKey(widget.sightMeta),
                child: _cardBody(context),
              )
            : _cardBody(context)
      ],
    );
  }

  ClipRRect _cardBody(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(children: [
          Column(
            children: [
              _cardHeaderImage(context),
              _cardContent(context),
            ],
          ),
          Positioned.fill(
            child: _cardClickArea(context),
          ),
          if (widget.sightCardState == SightCardState.simple)
            Positioned(
              right: 16,
              top: 16,
              child: SightCardTools(
                widget.sightMeta,
                onDelete: widget.onDelete,
              ),
            ),
        ]),
      ),
    );
  }

  Widget _cardClickArea(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, SightDetailsScreen.routeName,
            arguments: widget.sightMeta),
      ),
    );
  }

  Widget _cardContent(BuildContext context) {
    return Container(
      height: 108,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            widget.sightMeta.sight.name,
            maxLines: 2,
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
          const SizedBox(height: 4),
          _buildDetailInfo(context, widget.sightMeta),
          if (widget.sightMeta.wantVisit || widget.sightMeta.visited)
            _buildSightStatus(context),
        ],
      ),
    );
  }

  Widget _cardHeaderImage(BuildContext context) {
    return SizedBox(
        height: 96,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.sightMeta.sight.url,
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
            Positioned(
              left: 16,
              top: 16,
              child: Text(
                widget.sightMeta.sight.type.toText(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  Widget _buildDismissBackground(BuildContext context) {
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
                  .caption
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSightStatus(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 2),
          Text(
            'закрыто до 09:00',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1
                .copyWith(color: lmSecondary2Color),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }

  Widget _buildDetailInfo(BuildContext context, SightCardMeta sightMeta) {
    if (sightMeta.visited) {
      return Text(
        'Цель достигнута 12 окт. 2020',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).primaryTextTheme.bodyText1,
      );
    }
    if (sightMeta.wantVisit) {
      return Text(
        'Запланировано на 12 окт. 2020',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .primaryTextTheme
            .bodyText1
            .copyWith(color: lmGreenColor),
      );
    }
    return Text(
      sightMeta.sight.details,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).primaryTextTheme.bodyText1,
    );
  }
}

class SightCardTools extends StatelessWidget {
  const SightCardTools(this.sightMeta, {this.onDelete, Key key})
      : super(key: key);

  final SightCardMeta sightMeta;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (sightMeta.visited)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: btnIcon(
                icon: iconShare,
                onClick: () {
                  //print('on click iconShare');
                }),
          ),
        if (sightMeta.wantVisit)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: btnIcon(
                icon: iconCalendar,
                onClick: () {
                  //print('on click iconCalendar');
                }),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: (sightMeta.visited || sightMeta.wantVisit)
              ? btnIcon(icon: iconClose, onClick: onDelete)
              : btnIcon(
                  icon: iconHeart,
                  onClick: () {
                    //print('on click iconShare');
                  }),
        ),
      ],
    );
  }

  Widget btnIcon({String icon, VoidCallback onClick}) {
    return Material(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: onClick,
            child: SvgPicture.asset(icon)));
  }
}
