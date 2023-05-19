import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/core/localeSettings/lang_enum.dart';
import 'general_local_settings.dart';

class AppLanguageController extends GetxController {
  String _appLocale = GeneralLocaleSettings.defaultLang;

  final String _appLocaleKey = 'localeKey';

  RxString currentLang = GeneralLocaleSettings.defaultLang.obs;

  RxString currentSourceLang = GeneralLocaleSettings.defaultLang.obs;

  @override
  void onInit() {
    super.onInit();
    initAppLang();
  }

  set _updateAppLocale(String key) => _appLocale = key;

  void initAppLang() async {
    _callGetUpdateLocale();
  }

  void changeLanguage(ELanguages value) async {
    String key = value.code;

    if (key == ELanguages.system.code) {
      var locale = Get.deviceLocale;
      String code = locale == null ? _appLocale : locale.languageCode;
      if (code == ELanguages.english.code || code == ELanguages.arabic.code) {
        key = code;
      }
    }

    //when try update same language
    if (_appLocale == key) return;

    _updateAppLocale = key;
    _callGetUpdateLocale();
  }

  void _callGetUpdateLocale() {
    GeneralLocaleSettings.updateCurrentLocale = _appLocale;
    currentLang.value = _appLocale;
    Get.updateLocale(Locale(_appLocale));
    update();
  }
}
