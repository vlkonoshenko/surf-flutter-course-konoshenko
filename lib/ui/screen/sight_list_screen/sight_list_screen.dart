import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/data/model/place.dart';
import 'package:places/redux/app_state.dart';
import 'package:places/redux/places/places_action.dart';
import 'package:places/redux/places/places_state.dart';
import 'package:places/ui/components/circle_progress_loader.dart';
import 'package:places/ui/components/sight_card/sight_card.dart';
import 'package:places/ui/components/sight_list_screen/app_header_delegat.dart';
import 'package:places/ui/components/sight_list_screen/app_header_landscape_delegat.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/add_sight_btn.dart';

class SightListScreen extends StatefulWidget {
  static const String routeName = '/sight_list_screen';

  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final _controller = StreamController<List<Place>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StoreConnector<AppState, PlacesState>(
          onInit: (store) => store.dispatch(GetPlacesAction()),
          converter: (store) => store.state.placesState,
          builder: (context, state) {
            return state is PlacesResultState
                ? Stack(
                    children: [
                      OrientationBuilder(builder: (context, orientation) {
                        return orientation == Orientation.landscape
                            ? CustomScrollView(
                                slivers: [
                                  SliverPersistentHeader(
                                    pinned: true,
                                    floating: true,
                                    delegate: AppHeaderLandscapeDelegat(),
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
                                      (context, index) => SightCard(
                                        state.result[index],
                                        onDelete: () {
                                          return;
                                        },
                                        onVisited: () {
                                          return;
                                        },
                                      ),
                                      childCount: state.result.length,
                                    ),
                                  ),
                                ],
                              )
                            : CustomScrollView(
                                slivers: [
                                  SliverPersistentHeader(
                                    pinned: true,
                                    floating: true,
                                    delegate: AppHeaderDelegat(),
                                  ),
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) => SightCard(
                                        state.result[index],
                                        onDelete: () {
                                          return;
                                        },
                                        onVisited: () {
                                          return;
                                        },
                                      ),
                                      childCount: state.result.length,
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
                  )
                : const Center(child: CircleProgressLoader());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();

    super.dispose();
  }
}
