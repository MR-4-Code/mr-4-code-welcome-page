import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/localeSettings/general_local_settings.dart';
import 'welcome_screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PalStore',
        initialRoute: '/',
        locale: GeneralLocaleSettings.currentLocale,
        fallbackLocale: GeneralLocaleSettings.fallbackLocale,
        translations: GeneralLocaleSettings.translation,
        home: const WelcomeScreenBody());
  }
}
