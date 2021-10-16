import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/ui/components/add_signt_screen/add_photo_dialog.dart';
import 'package:places/ui/components/add_signt_screen/components.dart';

class PhotoGallery extends StatefulWidget {
  final Set<String> images;

  const PhotoGallery(this.images, {Key? key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            BtnAddPhoto(
              context: context,
              onAddClick: () => _dialogCall(context).then((value) {
                setState(() {
                  if (value != null) {
                    widget.images.add(value.path);
                  }
                });
              }),
            ),
            ...widget.images
                .map((e) => ImagePreview(
                      url: e,
                      onDelete: () {
                        setState(() {
                          widget.images.remove(e);
                        });
                      },
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }

  Future<XFile?> _dialogCall(BuildContext context) {
    return showDialog<XFile>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return const AddPhotoDialog();
      },
    );
  }
}
