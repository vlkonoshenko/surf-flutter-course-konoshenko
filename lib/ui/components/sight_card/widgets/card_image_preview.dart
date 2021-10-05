import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';

class CardImagePreview extends StatelessWidget {
  final Place place;

  const CardImagePreview({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: place.urls.first,
            child: Image.network(
              place.urls.isNotEmpty ? place.urls.first : '',
              fit: BoxFit.cover,
              frameBuilder: (
                context,
                child,
                frame,
                wasSynchronouslyLoaded,
              ) {
                return AnimatedOpacity(
                  child: child,
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Text(
              place.placeType,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
