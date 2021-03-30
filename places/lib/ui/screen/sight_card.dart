import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/res/res.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: cardBackground, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        sight.type,
                        style: textBoldSecondary14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      child: Container(
                        height: 24,
                        width: 24,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Text(
                    sight.name,
                    maxLines: 2,
                    style: textMedium16,
                  ),
                  Text(
                    sight.details,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textRegularSecondary14,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
