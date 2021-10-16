import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/res/colors.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/text_style.dart';

class AddPhotoDialog extends StatefulWidget {
  const AddPhotoDialog({Key? key}) : super(key: key);

  @override
  _AddPhotoDialogState createState() => _AddPhotoDialogState();
}

class _AddPhotoDialogState extends State<AddPhotoDialog> {
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then((value) => Navigator.pop<XFile?>(context, value));
                  },
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          iconCamera,
                          color: lmSecondary2Color,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Камера',
                          style: matSubtitle1.copyWith(color: lmSecondary2Color),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1, color: lmSecondary2Color),
                InkWell(
                  onTap: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) => Navigator.pop<XFile?>(context, value));
                  },
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          iconPhoto,
                          color: lmSecondary2Color,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Фотография',
                          style:
                              matSubtitle1.copyWith(color: lmSecondary2Color),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1, color: lmSecondary2Color),
                InkWell(
                  onTap: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) => Navigator.pop<XFile?>(context, value));
                  },
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(iconFail, color: lmSecondary2Color),
                        const SizedBox(width: 16),
                        Text(
                          'Файл',
                          style: matSubtitle1.copyWith(color: lmSecondary2Color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 48,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Center(
                child: Text(
                  'Отмена'.toUpperCase(),
                  style: textButtonElevation.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
