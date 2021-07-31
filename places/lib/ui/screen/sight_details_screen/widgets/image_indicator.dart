import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/res/res.dart';

class ImageIndicator extends StatefulWidget {
  final List<String> images;
  final int currentPageValue;

  const ImageIndicator({
    required this.images,
    required this.currentPageValue,
    Key? key,
  }) : super(key: key);

  @override
  ImageIndicatorState createState() => ImageIndicatorState();
}

class ImageIndicatorState extends State<ImageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.images.length; i++)
              Expanded(
                child: SizedBox(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: 8,
                    width: i == widget.currentPageValue
                        ? MediaQuery.of(context).size.width /
                            widget.images.length
                        : 0,
                    decoration: BoxDecoration(
                      color: i == widget.currentPageValue
                          ? lmMainColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            i == 0 ? Radius.zero : const Radius.circular(12),
                        topRight: i == widget.images.length - 1
                            ? Radius.zero
                            : const Radius.circular(12),
                        bottomRight: i == widget.images.length - 1
                            ? Radius.zero
                            : const Radius.circular(12),
                        bottomLeft:
                            i == 0 ? Radius.zero : const Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
