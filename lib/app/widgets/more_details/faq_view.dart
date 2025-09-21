import 'package:flutter/material.dart';
import 'package:palstore_welcome_page/app/widgets/build_text.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFaqItem(context, LocaleKeys.isPalStoreFree,
            LocaleKeys.isPalStoreFreeAnswer),
        _buildFaqItem(context, LocaleKeys.canIUsePalStoreOnPhoneAndComputer,
            LocaleKeys.canIUsePalStoreOnPhoneAndComputerAnswer),
        _buildFaqItem(context, LocaleKeys.howDoIGetStarted,
            LocaleKeys.howDoIGetStartedAnswer),
      ],
    );
  }

  Widget _buildFaqItem(
      BuildContext context, String questionKey, String answerKey) {
    return ExpansionTile(
      title: BuildText(data: questionKey),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildText(data: answerKey),
        ),
      ],
    );
  }
}
