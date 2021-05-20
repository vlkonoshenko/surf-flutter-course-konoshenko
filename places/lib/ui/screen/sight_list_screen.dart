import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/components/sight_list_screen/app_header_delegat.dart';
import 'package:places/ui/components/sight_list_screen/app_header_landscape_delegat.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key key}) : super(key: key);
  static const String routeName = '/sight_list_screen';

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            OrientationBuilder(builder: (context, orientation) {
              return orientation == Orientation.landscape
                  ? CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: AppHeaderLandscape(),
                        ),
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1.8,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => SightCard(mocks[index]),
                            childCount: mocks.length,
                          ),
                        ),
                      ],
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: AppHeader(),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => SightCard(mocks[index]),
                            childCount: mocks.length,
                          ),
                        ),
                      ],
                    );
            }),
            const Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: AddSightBtn(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddSightBtn extends StatelessWidget {
  const AddSightBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AddSightScreen.routeName);
          },
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffFCDD3D), Color(0xff4CAF50)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(26),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    iconPlus,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Новое место'.toUpperCase(),
                  style: textButtonElevation.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
