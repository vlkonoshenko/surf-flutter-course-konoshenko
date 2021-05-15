import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/icons.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/components/components.dart';
import 'package:places/ui/screen/select_category_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({Key key}) : super(key: key);
  static const String routeName = '/sight_details_screen';

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  SightCardMeta sight;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    if (args != null && args is SightCardMeta) {
      sight = ModalRoute.of(context).settings.arguments as SightCardMeta;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const BtnWhiteSquare(
                icon: Icons.arrow_back_ios_outlined,
              ),
            ),
            expandedHeight: 300,
            automaticallyImplyLeading: false,
            flexibleSpace: GalleryView(sight.sight.url),
          ),
          SliverToBoxAdapter(
            child: Padding(
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
                        sight.sight.name,
                        style: Theme.of(context).primaryTextTheme.headline5,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            sight.sight.type.toText(),
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle2
                                .copyWith(color: const Color(0xff7C7E92)),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'закрыто до 09:00',
                            style: Theme.of(context).primaryTextTheme.caption,
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        sight.sight.details,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      //print('on click iconGo');
                    },
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
                  Row(
                    children: [
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          //print('on click iconCalendar');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              iconCalendar,
                              color: lmSecondary2Color.withOpacity(0.56),
                            ),
                            const SizedBox(width: 8),
                            Text('Запланировать',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle2
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: lmSecondary2Color
                                            .withOpacity(0.56)))
                          ],
                        ),
                      )),
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          //print('on click iconHeart');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              iconHeart,
                              color: lmSecondary2Color.withOpacity(0.56),
                            ),
                            const SizedBox(width: 8),
                            Text('В Избранное',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle2
                                    .copyWith(fontWeight: FontWeight.w400))
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GalleryView extends StatefulWidget {
  const GalleryView(this.images, {Key key}) : super(key: key);
  final List<String> images;

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
            onPageChanged: (int page) {
              currentPageValue = page;
              setState(() {});
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
            }),
        if (widget.images.length > 1)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < widget.images.length; i++)
                      progressBar(i)
                  ],
                ),
              ],
            ),
          )
      ],
    );
  }

  Widget progressBar(int index) {
    final isActive = index == currentPageValue;
    return Expanded(
      child: SizedBox(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          height: 8,
          width: isActive
              ? MediaQuery.of(context).size.width / widget.images.length
              : 0,
          decoration: BoxDecoration(
              color: isActive ? lmMainColor : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: index == 0 ? Radius.circular(0) : Radius.circular(12),
                topRight: index == widget.images.length - 1
                    ? Radius.circular(0)
                    : Radius.circular(12),
                bottomRight: index == widget.images.length - 1
                    ? Radius.circular(0)
                    : Radius.circular(12),
                bottomLeft:
                    index == 0 ? Radius.circular(0) : Radius.circular(12),
              )),
        ),
      ),
    );
  }
}
