import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mwwm/mwwm.dart';
import 'package:places/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'data/icon.dart';

class MapScreenWM extends WidgetModel {
  final BuildContext _context;
  final Store<AppState> store;

  late YandexMapController yandexMapController;

  MapScreenWM(this._context, this.store)
      : super(const WidgetModelDependencies());

  Future<void> onMapLoaded() async {
    final position = await _getCurrentPosition();
    if (position != null) {
      await yandexMapController.addPlacemark(Placemark(
        point:
            Point(latitude: position.latitude, longitude: position.longitude),
        style: PlacemarkStyle(
          scale: 2,
          opacity: 1,
          iconName: 'assets/icons/marker_current.png',
        ),
      ));

      await yandexMapController.move(
        point: Point(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    }

    await _setMarkers();
  }

  Future<void> _setMarkers() async {
    for (final place in store.state.placesState.result) {
      await yandexMapController.addPlacemark(Placemark(
        point: Point(latitude: place.lat, longitude: place.lng),
        onTap: (placemark, __) {


          final Placemark _selectedPlacemark = Placemark(
            point: Point(latitude: place.lat, longitude: place.lng),
            style: PlacemarkStyle(
              scale: 1.5,
              opacity: 1,
              iconName: 'assets/icons/marker_selected_place.png',
            ),
          );

          yandexMapController.addPlacemark(_selectedPlacemark);


          // _onTapPlacemark(
          //   controller,
          //   place: places[i],
          // );
        },
        style: const PlacemarkStyle(
          scale: 2,
          opacity: 1,
          iconName: 'assets/icons/marker_place.png',
        ),
      ));
    }
  }

  Future<Position?> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return null;
    }

    return GeolocatorPlatform.instance.getCurrentPosition();
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled =
        await GeolocatorPlatform.instance.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await GeolocatorPlatform.instance.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await GeolocatorPlatform.instance.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<void> onMyLocationPressed() async {
    final position = await _getCurrentPosition();
    if (position != null) {
      await yandexMapController.move(
        point: Point(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    }
  }

  Future<void> onRefreshPressed() async {
    for (final place in store.state.placesState.result) {
      await yandexMapController.addPlacemark(Placemark(
        point: Point(latitude: place.lat, longitude: place.lng),
        onTap: (_, __) {
          // _onTapPlacemark(
          //   controller,
          //   place: places[i],
          // );
        },
        style: PlacemarkStyle(
          scale: 2,
          opacity: 1,
          rawImageData: rawImageData,
        ),
      ));
    }
  }
}

MapScreenWM createMapScreenWM(BuildContext context, Store<AppState> store) =>
    MapScreenWM(context, store);
