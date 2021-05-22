import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/components/components.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({this.sight, Key key}) : super(key: key);
  static const String routeName = '/sight_details_screen';
  final SightCardMeta sight;

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  SightCardMeta sight;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    sight = args != null && args is SightCardMeta
        ? ModalRoute.of(context).settings.arguments as SightCardMeta
        : widget.sight;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      builder: (context, controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                actions: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(left: 16),
                    child: const BtnWhiteSquare(
                      icon: Icons.arrow_back_ios_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
                expandedHeight: 300,
                automaticallyImplyLeading: false,
                flexibleSpace: _GalleryView(sight.sight.url),
              ),
              SliverToBoxAdapter(
                child: _BodyContent(sight.sight),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent(this.sight, {Key key}) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sight.name,
                style: Theme.of(context).primaryTextTheme.headline5,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    sight.type.toText(),
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle2
                        .copyWith(color: const Color(0xff7C7E92)),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'закрыто до 09:00',
                    style: Theme.of(context).primaryTextTheme.caption,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                sight.details,
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconGo,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Построить маршрут'.toUpperCase(),
                  style: textButtonElevation,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 8),
          const _BottomControlPanel(),
        ],
      ),
    );
  }
}

class _BottomControlPanel extends StatefulWidget {
  const _BottomControlPanel({Key key}) : super(key: key);

  @override
  __BottomControlPanelState createState() => __BottomControlPanelState();
}

class __BottomControlPanelState extends State<_BottomControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: _onClickPlanning,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconCalendar,
                  color: lmSecondary2Color.withOpacity(0.56),
                ),
                const SizedBox(width: 8),
                Text(
                  'Запланировать',
                  style: Theme.of(context).primaryTextTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: lmSecondary2Color.withOpacity(0.56),
                      ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconHeart,
                  color: lmSecondary2Color.withOpacity(0.56),
                ),
                const SizedBox(width: 8),
                Text(
                  'В Избранное',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onClickPlanning() {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (_) => Container(
          color: Colors.white,
          height: 200,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (value){},
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 100)),
        lastDate: DateTime.now().add(const Duration(days: 100)),
      ).then((value) =>
          showTimePicker(context: context, initialTime: TimeOfDay.now()));
    }
  }
}

class _GalleryView extends StatefulWidget {
  const _GalleryView(this.images, {Key key}) : super(key: key);
  final List<String> images;

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<_GalleryView> {
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
                            loadingProgress.expectedTotalBytes
                        : null,
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
            child: _ImageIndicator(
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

class _ImageIndicator extends StatefulWidget {
  const _ImageIndicator({
    @required this.images,
    @required this.currentPageValue,
    Key key,
  }) : super(key: key);

  final List<String> images;
  final int currentPageValue;

  @override
  __ImageIndicatorState createState() => __ImageIndicatorState();
}

class __ImageIndicatorState extends State<_ImageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                        topLeft: i == 0
                            ? const Radius.circular(0)
                            : const Radius.circular(12),
                        topRight: i == widget.images.length - 1
                            ? const Radius.circular(0)
                            : const Radius.circular(12),
                        bottomRight: i == widget.images.length - 1
                            ? const Radius.circular(0)
                            : const Radius.circular(12),
                        bottomLeft: i == 0
                            ? const Radius.circular(0)
                            : const Radius.circular(12),
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
