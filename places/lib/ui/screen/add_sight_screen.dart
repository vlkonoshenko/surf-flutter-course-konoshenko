import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/res/res.dart';
import 'package:places/res/text_style.dart';
import 'package:places/ui/components/add_signt_screen/add_photo_dialog.dart';
import 'package:places/ui/components/add_signt_screen/components.dart';
import 'package:places/ui/components/label_text_widget.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key key}) : super(key: key);
  static const String routeName = '/add_sight_screen';

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

  SightCategory selectedCategory;

  final images = [
    'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
    'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
    'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg',
    'https://infodon.org.ua/wp-content/uploads/2019/08/Donbass-Arena-1500x916.jpg'
  ];

  @override
  void initState() {
    super.initState();
    _fnTitle.addListener(() {
      setState(() {});
    });
    _fnDescription.addListener(() {
      setState(() {});
    });
    _fnLon.addListener(() {
      setState(() {});
    });
    _fnLat.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _isBtnValid()
              ? () {
                  mocks.add(SightCardMeta(Sight(
                    _tcTitle.text,
                    [],
                    Coordinate(
                      double.tryParse(_tcLat.text),
                      double.tryParse(_tcLon.text),
                    ),
                    _tcDescription.text,
                    selectedCategory,
                  )));
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
                      color: lmSecondary2Color, fontWeight: FontWeight.w300),
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
                      .subtitle1
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPhotoGallery(),
              _buildCategory(),
              const SizedBox(height: 24),
              _buildTitle(),
              const SizedBox(height: 24),
              _buildCoordinate(),
              const SizedBox(height: 24),
              _buildDescription(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
        const LabelWidget('категория'),
        const SizedBox(height: 16),
        InkWell(
          onTap: () async {
            final result = await Navigator.pushNamed<SightCategory>(
                context, SelectCategoryScreen.routeName);
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
                selectedCategory != null
                    ? selectedCategory.toText()
                    : 'Не выбрано',
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle2
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        const LabelWidget('название'),
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
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      children: [
        const LabelWidget('описание'),
        const SizedBox(height: 16),
        TextField(
          focusNode: _fnDescription,
          controller: _tcDescription,
          maxLines: null,
          textInputAction: TextInputAction.done,
          minLines: 3,
          decoration: InputDecoration(
            hintText: 'введите текст',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 40, minWidth: 40),
            suffixIcon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _fnDescription.hasFocus
                  ? TextFieldCleanSuffix(_tcDescription)
                  : const SizedBox.shrink(),
            ),
          ),
          cursorHeight: 24,
          cursorWidth: 1,
          onSubmitted: (value) => FocusManager.instance.primaryFocus.unfocus(),
          cursorColor: lmMainColor,
        ),
      ],
    );
  }

  Widget _buildCoordinate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const LabelWidget('широта'),
                  const SizedBox(height: 16),
                  TextField(
                    focusNode: _fnLat,
                    controller: _tcLat,
                    onChanged: (value) {},
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                  )
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  const LabelWidget('долгота'),
                  const SizedBox(height: 16),
                  TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSubmitted: (value) => _fnDescription.requestFocus(),
                    focusNode: _fnLon,
                    controller: _tcLon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'введите текст',
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 40, minWidth: 40),
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
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Указать на карте',
          style: textMedium.copyWith(color: lmGreenColor),
        )
      ],
    );
  }

  bool _isBtnValid() {
    return selectedCategory != null &&
        _tcDescription.text.isNotEmpty &&
        _tcLon.text.isNotEmpty &&
        _tcLat.text.isNotEmpty &&
        _tcTitle.text.isNotEmpty;
  }

  Widget _buildPhotoGallery() {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            BtnAddPhoto(
              context: context,
              onAddClick: () => _dialogCall(context),
            ),
            ...images
                .map((e) => ImagePreview(
                      url: e,
                      onDelete: () {
                        images.remove(e);
                        setState(() {});
                      },
                    ))
                .toList()
          ],
        ),
      ),
    );
  }

  Future<void> _dialogCall(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return  AddPhotoDialog();
        });
  }
}
