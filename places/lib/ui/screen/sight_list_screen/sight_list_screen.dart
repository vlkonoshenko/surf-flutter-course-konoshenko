import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/components/sight_list_screen/app_header_delegat.dart';
import 'package:places/ui/components/sight_list_screen/app_header_landscape_delegat.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/add_sight_btn.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_error_widget.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatefulWidget {
  static const String routeName = '/sight_list_screen';

  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final _controller = StreamController<List<Place>>();

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StreamBuilder<List<Place>>(
          stream: _controller.stream,
          builder: (context, snap) {
            if (snap.hasError) {
              return SightListErrorWidget(
                title: 'Ошибка',
                subtitle: snap.error.toString(),
              );
            }

            return snap.hasData
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
                                        snap.data![index],
                                        onDelete: () {
                                          return;
                                        },
                                      ),
                                      childCount: snap.data!.length,
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
                                        snap.data![index],
                                        onDelete: () {
                                          return;
                                        },
                                      ),
                                      childCount: snap.data!.length,
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
                : const Center(child: CircularProgressIndicator());
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

  void _fetchData() {
    context
        .read<PlaceInteractor>()
        .getPlaces()
        .then(_controller.add)
        .catchError(_controller.addError);
  }
}
