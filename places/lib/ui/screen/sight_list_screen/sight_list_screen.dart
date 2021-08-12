import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/service/api_client.dart';
import 'package:places/store/place_store.dart';
import 'package:places/ui/components/sight_list_screen/app_header_delegat.dart';
import 'package:places/ui/components/sight_list_screen/app_header_landscape_delegat.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/add_sight_btn.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatefulWidget {
  static const String routeName = '/sight_list_screen';

  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final _controller = StreamController<List<Place>>();

  late PlaceStore _store;

  @override
  void initState() {
    super.initState();
    _store = PlaceStore(PlaceRepository(ApiClient().createDio()));
    _store.getPlaces();
    //_fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Observer(builder: (context) {
          final future = _store.getPlacesFuture;
          if (future != null && future.status == FutureStatus.pending) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final placesData = future?.value ?? [];

            return Stack(
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
                                  placesData[index],
                                  onDelete: () {
                                    return;
                                  },
                                ),
                                childCount: placesData.length,
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
                                  placesData[index],
                                  onDelete: () {
                                    return;
                                  },
                                ),
                                childCount: placesData.length,
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
            );
          }
        }),
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
