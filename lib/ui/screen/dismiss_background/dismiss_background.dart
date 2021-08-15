import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/res/colors.dart';
import 'package:places/res/icons.dart';

class DismissBackground extends StatelessWidget {
  const DismissBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: lmRedColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconBucket,
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 8),
            Text(
              'Удалить',
              style: Theme.of(context)
                  .primaryTextTheme
                  .caption!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// class SightCardTools extends StatelessWidget {
//   const SightCardTools(this.sightMeta, {this.onDelete, Key key})
//       : super(key: key);
//
//   final SightCardMeta sightMeta;
//   final VoidCallback onDelete;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (sightMeta.visited)
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: _BtnToolIcon(
//               icon: iconShare,
//               onClick: () {
//                 //print('on click iconShare');
//               },
//             ),
//           ),
//         if (sightMeta.wantVisit)
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: _BtnToolIcon(
//               icon: iconCalendar,
//               onClick: () {
//                 //print('on click iconCalendar');
//               },
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.only(left: 16.0),
//           child: (sightMeta.visited || sightMeta.wantVisit)
//               ? _BtnToolIcon(icon: iconClose, onClick: onDelete)
//               : _BtnToolIcon(
//                   icon: iconHeart,
//                   onClick: () {
//                     //print('on click iconShare');
//                   },
//                 ),
//         ),
//       ],
//     );
//   }
// }

// class _BtnToolIcon extends StatelessWidget {
//   final VoidCallback onClick;
//   final String icon;
//
//   const _BtnToolIcon({
//     required this.icon,
//     required this.onClick,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(100),
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(100),
//         onTap: onClick,
//         child: SvgPicture.asset(icon),
//       ),
//     );
//   }
// }
