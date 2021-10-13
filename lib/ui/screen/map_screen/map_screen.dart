import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/map_screen/widgets/bottom_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'map_screen_wm.dart';

const String mapLightStyle = '''
    [
      {
        "stylers": {
          "saturation": -1,
          "lightness": 0.4
        }
      }
    ]
  ''';

class MapScreen extends CoreMwwmWidget<MapScreenWM> {
  const MapScreen({
    Key? key,
    required WidgetModelBuilder<MapScreenWM> widgetModelBuilder,
  }) : super(key: key, widgetModelBuilder: widgetModelBuilder);

  @override
  WidgetState<MapScreen, MapScreenWM> createWidgetState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends WidgetState<MapScreen, MapScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        YandexMap(
          onMapCreated: (yandexMapController) async {
            wm.yandexMapController = yandexMapController;

            await wm.yandexMapController.logoAlignment(
              horizontal: HorizontalAlignment.left,
              vertical: VerticalAlignment.top,
            );
            await wm.yandexMapController.toggleNightMode(enabled: true);

            await wm.yandexMapController.setMapStyle(style: mapLightStyle);

            await wm.onMapLoaded();
          },
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: ValueListenableBuilder<Place?>(
            valueListenable: wm.selectedPlace,
            builder: (context, value, child) {
              return BottomPanel(
                place: value,
                onPressedRefresh: () {
                  wm.onRefreshPressed();
                },
                onPressedGeolocation: () {
                  wm.onMyLocationPressed();
                },
              );
            },
          ),
        )
      ],
    ));
  }
}
