import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'map_screen_wm.dart';

class MapScreen extends CoreMwwmWidget<MapScreenWM> {
  const MapScreen(
    WidgetModelBuilder<MapScreenWM> widgetModelBuilder, {
    Key? key,
  }) : super(key: key, widgetModelBuilder: widgetModelBuilder);

  @override
  WidgetState<CoreMwwmWidget<MapScreenWM>, MapScreenWM> createWidgetState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends WidgetState<MapScreen, MapScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Center(child: YandexMap(
      onMapCreated: (yandexMapController) async {
        wm.yandexMapController = yandexMapController;
        await wm.onMapLoaded();
      },
    ));
  }
}
