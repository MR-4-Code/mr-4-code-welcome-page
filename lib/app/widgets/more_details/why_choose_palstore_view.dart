import 'package:flutter/material.dart';
import 'package:palstore_welcome_page/app/widgets/build_text.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';

class WhyChoosePalStoreView extends StatelessWidget {
  const WhyChoosePalStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBenefitItem(context, Icons.phone_android,
            LocaleKeys.crossPlatform, LocaleKeys.crossPlatformDescription),
        _buildBenefitItem(context, Icons.analytics, LocaleKeys.easyManagement,
            LocaleKeys.easyManagementDescription),
        _buildBenefitItem(context, Icons.monetization_on,
            LocaleKeys.freeService, LocaleKeys.freeServiceDescription),
        _buildBenefitItem(context, Icons.security, LocaleKeys.secureAndReliable,
            LocaleKeys.secureAndReliableDescription),
      ],
    );
  }

  Widget _buildBenefitItem(BuildContext context, IconData icon, String titleKey,
      String descriptionKey) {
    return ListTile(
      leading: Icon(icon),
      title: BuildText(data: titleKey),
      subtitle: BuildText(data: descriptionKey),
    );
  }
}
