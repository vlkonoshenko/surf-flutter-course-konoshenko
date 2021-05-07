import 'package:flutter/material.dart';
import 'package:places/ui/components/components.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 12.0, left: 16),
      child: const BtnWhiteSquare(
        icon: Icons.arrow_back_ios_outlined,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
