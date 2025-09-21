import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '/core/constants/locale_keys.dart';
import '../screens/about_app/about_app_screen.dart';

class _DrawerItems {
  _DrawerItems._();

  static final Map<String, Widget> items = {
    LocaleKeys.aboutApp: const AboutAppScreen(),
  };

  static Map<String, IconData> icons = {
    LocaleKeys.aboutApp: FontAwesomeIcons.info,
  };

  static IconData _iconFromKey(String key) {
    return icons[key] ?? Icons.circle;
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) {
          final page = _DrawerItems.items['$value'];
          if (page is! Widget) return;
          Get.to(page);
        },
        icon: const Icon(Icons.menu),
        tooltip: LocaleKeys.menu.tr,
        itemBuilder: (_) =>
            _DrawerItems.items.entries.map(_drawerElement).toList());
  }

  PopupMenuItem _drawerElement(MapEntry<String, Widget> entry) {
    return PopupMenuItem(
        value: entry.key,
        mouseCursor: MouseCursor.defer,
        child: ListTile(
            leading: Icon(_DrawerItems._iconFromKey(entry.key)),
            title: Text(entry.key.tr)));
  }
}
