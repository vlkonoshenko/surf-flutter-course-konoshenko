import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

class SightCardMeta {
  Sight sight;
  bool wantVisit;
  bool visited;

  SightCardMeta(this.sight, {this.wantVisit = false, this.visited = false});

  SightCardMeta copyWith({bool wantVisit, bool visited}) {
    return SightCardMeta(
      this.sight,
      wantVisit: wantVisit ?? this.wantVisit,
      visited: visited ?? this.visited,
    );
  }
}

class SightCard extends StatelessWidget {
  final SightCardMeta sightMeta;

  SightCard(this.sightMeta);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, SightDetailsScreen.routeName,
            arguments: sightMeta),
        child: Column(
          children: [
            Container(
                height: 96,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      sightMeta.sight.url,
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
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        sightMeta.sight.type,
                        style: textBoldSecondary14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      child: SightCardTools(sightMeta),
                    ),
                  ],
                )),
            Container(
              height: 102,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Text(
                    sightMeta.sight.name,
                    maxLines: 2,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                  SizedBox(height: 4),
                  _buildDetailInfo(sightMeta),
                  if (sightMeta.wantVisit || sightMeta.visited)
                    _buildSightStatus(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSightStatus() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'закрыто до 09:00',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textRegularSecondary14,
          ),
          SizedBox(height: 12)
        ],
      ),
    );
  }

  Widget _buildDetailInfo(SightCardMeta sightMeta) {
    if (sightMeta.visited) {
      return Text(
        'Цель достигнута 12 окт. 2020',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textRegularSecondary14,
      );
    }
    if (sightMeta.wantVisit) {
      return Text(
        'Запланировано на 12 окт. 2020',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textRegularSecondary14.copyWith(color: greenFromFigma),
      );
    }
    return Text(
      sightMeta.sight.details,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textRegularSecondary14,
    );
  }
}

class SightCardTools extends StatelessWidget {
  final SightCardMeta sightMeta;

  const SightCardTools(this.sightMeta);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (sightMeta.visited)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
          ),
        if (sightMeta.wantVisit)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.calendar_today_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(
            (sightMeta.visited || sightMeta.wantVisit)
                ? Icons.close
                : Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
