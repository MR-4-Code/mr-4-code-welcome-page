import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palstore_welcome_page/app/widgets/build_text.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';
import 'package:palstore_welcome_page/core/localeSettings/app_language_controller.dart';
import 'package:palstore_welcome_page/core/localeSettings/lang_enum.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.language),
        tooltip: LocaleKeys.language.tr,
        onSelected: (value) {
          Get.find<AppLanguageController>().changeLanguage(value);
        },
        itemBuilder: (_) => [ELanguages.english, ELanguages.arabic]
            .map((e) => PopupMenuItem(value: e, child: BuildText(data: e.code)))
            .toList());
  }
}
