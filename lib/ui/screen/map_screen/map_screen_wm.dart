import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mwwm/mwwm.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreenWM extends WidgetModel {
  final BuildContext _context;
  late YandexMapController yandexMapController;

  MapScreenWM(this._context) : super(const WidgetModelDependencies());

  Future<void> onMapLoaded() async {
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
}

MapScreenWM createMapScreenWM(BuildContext context) => MapScreenWM(context);
