import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/res/icons.dart';

class ImagePreview extends StatelessWidget {
  final String url;
  final VoidCallback onDelete;

  const ImagePreview({
    required this.url,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => onDelete(),
      direction: DismissDirection.up,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  onTap: onDelete,
                  child: SvgPicture.asset(
                    iconClear,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
