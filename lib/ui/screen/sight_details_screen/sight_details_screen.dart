import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/components/components.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/body_content_widget.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/gallery_view.dart';

class SightDetailsScreen extends StatefulWidget {
  static const String routeName = '/sight_details_screen';

  final Place sight;

  const SightDetailsScreen({required this.sight, Key? key}) : super(key: key);

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  late Place sight;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    sight = args != null && args is Place
        ? ModalRoute.of(context)!.settings.arguments as Place
        : widget.sight;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
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
            flexibleSpace:
                Hero(tag: sight.urls.first, child: GalleryView(sight.urls)),
          ),
          SliverToBoxAdapter(
            child: BodyContentWidget(sight),
          ),
        ],
      ),
    );
  }
}
