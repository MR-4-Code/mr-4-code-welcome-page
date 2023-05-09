import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/about_app/about_app_screen.dart';

class _DrawerItems {
  _DrawerItems._();

  static final Map<String, Widget> items = {
    'About App': const AboutAppScreen(),
  };
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: Get.back, icon: const Icon(Icons.close)),
            ..._DrawerItems.items.entries.map(_drawerElement).toList()
          ],
        ),
      ),
    );
  }

  Widget _drawerElement(MapEntry<String, Widget> entry) {
    return ListTile(
      title: Text(entry.key.tr),
      onTap: () {
        Get.back();
        Get.to(entry.value);
      },
    );
  }
}
