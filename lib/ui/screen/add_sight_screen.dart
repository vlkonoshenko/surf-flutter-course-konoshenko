import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/res/res.dart';
import 'package:places/res/text_style.dart';
import 'package:places/ui/components/add_signt_screen/components.dart';
import 'package:places/ui/components/label_text_widget.dart';
import 'package:places/ui/screen/select_category_screen.dart';

import 'sight_search_screen/widgets/photo_gallery.dart';

const _images = [
  'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
  'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
  'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
  'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
];

class AddSightScreen extends StatefulWidget {
  static const String routeName = '/add_sight_screen';

  const AddSightScreen({Key? key}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final TextEditingController _tcTitle = TextEditingController();
  final TextEditingController _tcDescription = TextEditingController();
  final TextEditingController _tcLat = TextEditingController();
  final TextEditingController _tcLon = TextEditingController();

  final FocusNode _fnTitle = FocusNode();
  final FocusNode _fnDescription = FocusNode();
  final FocusNode _fnLat = FocusNode();
  final FocusNode _fnLon = FocusNode();

  SightCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _isBtnValid()
              ? () {
                  // mocks.add(SightCardMeta(Sight(
                  //   _tcTitle.text,
                  //   [],
                  //   Coordinate(
                  //     double.tryParse(_tcLat.text),
                  //     double.tryParse(_tcLon.text),
                  //   ),
                  //   _tcDescription.text,
                  //   selectedCategory,
                  // )));
                  Navigator.pop(context);
                }
              : null,
          child: Text(
            'Создать'.toUpperCase(),
            style: textButtonElevation,
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  'Отмена',
                  style: textMedium.copyWith(
                    color: lmSecondary2Color,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Новое место',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const PhotoGallery(_images),
            Column(
              children: [
                const LabelTextWidget('категория'),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final result = await Navigator.pushNamed<SightCategory>(
                      context,
                      SelectCategoryScreen.routeName,
                    );
                    if (result != null) {
                      setState(() {
                        selectedCategory = result;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory?.toText() ?? 'Не выбрано',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle2!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
            const SizedBox(height: 24),
            const LabelTextWidget('название'),
            const SizedBox(height: 16),
            TextField(
              focusNode: _fnTitle,
              controller: _tcTitle,
              decoration: InputDecoration(
                hintText: 'Название места',
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 40,
                  minWidth: 40,
                ),
                suffixIcon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _fnTitle.hasFocus
                      ? TextFieldCleanSuffix(_tcTitle)
                      : const SizedBox.shrink(),
                ),
              ),
              onSubmitted: (value) => _fnLat.requestFocus(),
              cursorHeight: 24,
              cursorWidth: 1,
              cursorColor: lmMainColor,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const LabelTextWidget('широта'),
                      const SizedBox(height: 16),
                      TextField(
                        focusNode: _fnLat,
                        controller: _tcLat,
                        onChanged: (value) {
                          return;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) => _fnLon.requestFocus(),
                        decoration: InputDecoration(
                          hintText: 'введите текст',
                          suffixIconConstraints:
                              const BoxConstraints(maxHeight: 40),
                          suffixIcon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _fnLat.hasFocus
                                ? TextFieldCleanSuffix(_tcLat)
                                : const SizedBox.shrink(),
                          ),
                        ),
                        cursorHeight: 24,
                        cursorWidth: 1,
                        cursorColor: lmMainColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      const LabelTextWidget('долгота'),
                      const SizedBox(height: 16),
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onSubmitted: (value) => _fnDescription.requestFocus(),
                        focusNode: _fnLon,
                        controller: _tcLon,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'введите текст',
                          suffixIconConstraints: const BoxConstraints(
                            maxHeight: 40,
                            minWidth: 40,
                          ),
                          suffixIcon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _fnLon.hasFocus
                                ? TextFieldCleanSuffix(_tcLon)
                                : const SizedBox.shrink(),
                          ),
                        ),
                        cursorHeight: 24,
                        cursorWidth: 1,
                        cursorColor: lmMainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Указать на карте',
              style: textMedium.copyWith(color: lmGreenColor),
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                const LabelTextWidget('описание'),
                const SizedBox(height: 16),
                TextField(
                  focusNode: _fnDescription,
                  controller: _tcDescription,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: 'введите текст',
                    contentPadding: const EdgeInsets.all(16.0),
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 40,
                      minWidth: 40,
                    ),
                    suffixIcon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _fnDescription.hasFocus
                          ? TextFieldCleanSuffix(_tcDescription)
                          : const SizedBox.shrink(),
                    ),
                  ),
                  cursorHeight: 24,
                  cursorWidth: 1,
                  onSubmitted: (value) =>
                      FocusManager.instance.primaryFocus!.unfocus(),
                  cursorColor: lmMainColor,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  bool _isBtnValid() {
    return selectedCategory != null &&
        _tcDescription.text.isNotEmpty &&
        _tcLon.text.isNotEmpty &&
        _tcLat.text.isNotEmpty &&
        _tcTitle.text.isNotEmpty;
  }
}