import 'package:flutter/material.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';

import '../build_text.dart';

class WhatIsPalStoreView extends StatelessWidget {
  const WhatIsPalStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BuildText(
          data: LocaleKeys.whatIsPalStoreDescription,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Icon(Icons.store, size: 50),
      ],
    );
  }
}
