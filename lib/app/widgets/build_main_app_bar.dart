import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_drawer.dart';

class BuildMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildMainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Get.dialog(const CustomDrawer());
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
