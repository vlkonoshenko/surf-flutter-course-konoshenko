import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/add_sight_btn.dart';

class BottomPanel extends StatelessWidget {
  final VoidCallback onPressedRefresh;
  final VoidCallback onPressedGeolocation;
  final Place? place;

  const BottomPanel({
    Key? key,
    required this.onPressedRefresh,
    required this.onPressedGeolocation,
    this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.small(
              onPressed: onPressedRefresh,
              backgroundColor: Colors.white,
              child: const Icon(Icons.sync,color: Colors.black,),
            ),

            if (place == null) AddSightBtn(),
            // ButtonRounded(
            //   size: 50,
            //   radius: 50,
            //   backgroundColor: UiUtils.setColorForTheme(
            //     context,
            //     light: Theme.of(context).colorScheme.white,
            //     dark: Theme.of(context).colorScheme.secondary,
            //   ),
            //   icon: icGeolocation,
            //   iconColor: Theme.of(context).colorScheme.primary,
            //   elevation: 2,
            //   onPressed: onPressedGeolocation,
            // ),
            FloatingActionButton.small(
              onPressed: onPressedGeolocation,
              backgroundColor: Colors.white,
              child: const Icon(Icons.navigation,color: Colors.black,),
            ),
          ],
        ),
        if (place != null) Text('asd')
        // PlaceCardMap(
        //   place: state.place!,
        //   cardType: CardType.map,
        // ),
      ],
    );
  }
}
