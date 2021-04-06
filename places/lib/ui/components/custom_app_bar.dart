import 'package:flutter/material.dart';
import 'package:places/ui/components/components.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 40.0, left: 16),

      child: BtnWhiteSquare(
        icon: Icons.arrow_back_ios_outlined,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(68);
}