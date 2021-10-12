import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:places/ui/components/circle_progress_loader.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  late YandexMapController controller;
  static const Point _point = Point(latitude: 59.945933, longitude: 30.320045);
  final Placemark _placemark = Placemark(
    point: _point,
    onTap: (Placemark self, Point point) => debugPrint('Tapped me at $point'),
    style: const PlacemarkStyle(
      opacity: 0.7,
      iconName: 'lib/assets/place.png',
    ),
  );

  final Placemark _placemarkWithDynamicIcon = Placemark(
    point: const Point(latitude: 30.320045, longitude: 59.945933),
    onTap: (Placemark self, Point point) => debugPrint('Tapped me at $point'),
    style: PlacemarkStyle(
      opacity: 0.95,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position?>(
      future: _getCurrentPosition(),
      builder: (_, position) {
        if (position.hasData) {
          return Center(child: Expanded(child: YandexMap(
            onMapCreated: (yandexMapController) async {
              controller = yandexMapController;
              await controller.move(
                  point: Point(
                latitude: position.data!.latitude,
                longitude: position.data!.longitude,
              ));
            },
          )));
        } else {
          return const Center(child: CircleProgressLoader());
        }
      },
    );
  }

  Future<Position?> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return null;
    }

    return _geolocatorPlatform.getCurrentPosition();
    // _updatePositionList(
    //   _PositionItemType.position,
    //   position.toString(),
    // );
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // _updatePositionList(
      //   _PositionItemType.log,
      //   _kLocationServicesDisabledMessage,
      // );

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // _updatePositionList(
        //   _PositionItemType.log,
        //   _kPermissionDeniedMessage,
        // );

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // _updatePositionList(
      //   _PositionItemType.log,
      //   _kPermissionDeniedForeverMessage,
      // );

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // _updatePositionList(
    //   _PositionItemType.log,
    //   _kPermissionGrantedMessage,
    // );
    return true;
  }
}
