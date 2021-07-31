import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/image_indicator.dart';

class GalleryView extends StatefulWidget {
  final List<String> images;

  const GalleryView(this.images, {Key? key}) : super(key: key);

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  int currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (page) {
            setState(() {
              currentPageValue = page;
            });
          },
          physics: const ClampingScrollPhysics(),
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.images[index],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Center(
                  child: CupertinoActivityIndicator.partiallyRevealed(
                    progress: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : 0.0,
                  ),
                );
              },
            );
          },
        ),
        if (widget.images.length > 1)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ImageIndicator(
              images: widget.images,
              currentPageValue: currentPageValue,
            ),
          ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 4,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
