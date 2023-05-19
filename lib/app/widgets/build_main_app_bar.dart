import 'package:flutter/material.dart';

import 'custom_drawer.dart';
import 'language_drop_down.dart';

class BuildMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildMainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [CustomDrawer(), LanguageDropDown()]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
