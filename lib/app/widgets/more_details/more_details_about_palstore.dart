import 'package:flutter/material.dart';
import 'package:palstore_welcome_page/app/widgets/build_text.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';

import 'faq_view.dart';
import 'what_is_palstore_view.dart';
import 'why_choose_palstore_view.dart';

class MoreDetailsAboutPalStore extends StatefulWidget {
  const MoreDetailsAboutPalStore({super.key});

  @override
  State<MoreDetailsAboutPalStore> createState() =>
      _MoreDetailsAboutPalStoreState();
}

class _MoreDetailsAboutPalStoreState extends State<MoreDetailsAboutPalStore> {
  int? _currentlyExpandedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2,
      child: Column(
        children: [
          // Section 1: What is PalStore?
          _buildExpandableCard(
            index: 0,
            title: LocaleKeys.whatIsPalStore,
            child: const WhatIsPalStoreView(),
          ),
          // Section 2: Why Choose PalStore?
          _buildExpandableCard(
            index: 1,
            title: LocaleKeys.whyChoosePalStore,
            child: const WhyChoosePalStoreView(),
          ),
          // Section 3: FAQ
          _buildExpandableCard(
            index: 2,
            title: LocaleKeys.faq,
            child: const FaqView(),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableCard({
    required int index,
    required String title,
    required Widget child,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // <-- Remove divider color
        ),
        child: ExpansionTile(
          key: GlobalKey(),
          title: BuildText(data: title),
          initiallyExpanded: _currentlyExpandedIndex == index,
          onExpansionChanged: (isExpanded) {
            setState(() {
              _currentlyExpandedIndex = isExpanded ? index : null;
            });
          },
          tilePadding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Optional: Adjust padding
          childrenPadding: const EdgeInsets.only(
              bottom: 16.0), // Optional: Adjust children padding
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
