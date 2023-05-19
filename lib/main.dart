import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/root/root.dart';
import 'core/localeSettings/app_language_controller.dart';

void main() {
  _initPreLaunchSettings();
  runApp(const WelcomeScreen());
}

void _initPreLaunchSettings() {
  Get.put(AppLanguageController());
}
