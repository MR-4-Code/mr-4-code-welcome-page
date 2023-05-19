import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:palstore_welcome_page/app/widgets/download_for_windows_button.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';

import '/app/widgets/build_main_app_bar.dart';
import '/core/constants/assets_keys.dart';
import '/core/constants/store_links.dart';
import '/core/presentation/style/palette.dart';
import '../widgets/app_name.dart';
import '../widgets/build_text.dart';
import '../widgets/footer.dart';
import '../widgets/space.dart';
import '../widgets/store_button.dart';

const double radius = 35.0;
final borderRadius = BorderRadius.circular(radius);

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const secondContainerRadius = Radius.circular(radius);
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(40),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: const BorderSide(color: Palette.lightGreen, width: 2)),
        elevation: 15.0,
        shadowColor: Palette.lightGreen,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: borderRadius, color: Palette.lightGreen)),
            Container(
                decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.only(
                        topLeft: secondContainerRadius,
                        bottomRight: Radius.circular(radius * 2),
                        topRight: secondContainerRadius,
                        bottomLeft: Radius.circular(1000)))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BuildMainAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      AppName(),
                      Space.vertical(10.0),
                      WelcomeScreenHint(),
                      Space.vertical(10.0),
                      DownloadForWindowsButton(),
                      StoreButtons()
                    ])),
                  ),
                  Footer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreButtons extends StatelessWidget {
  const StoreButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: TextDirection.ltr,
        children: [
          BuildText(data: LocaleKeys.downloadForMobile, size: 16.0),
          StoreButton(link: StoreLinks.playStore, image: Assets.playStore),
          Space.vertical(10.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              textDirection: TextDirection.ltr,
              children: [
                _ToolTipStoreButton(
                    child: StoreButton(image: Assets.appGallery)),
                Space.horizontal(10.0),
                _ToolTipStoreButton(child: StoreButton(image: Assets.appStore)),
              ]),
          Space.vertical(10.0),
        ],
      ),
    );
  }
}

class _ToolTipStoreButton extends StatelessWidget {
  final Widget child;
  const _ToolTipStoreButton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: LocaleKeys.comingSoonOn.tr, child: child);
  }
}

class WelcomeAnim extends StatelessWidget {
  const WelcomeAnim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const path = 'images/${Assets.welcomeAnim}.json';
    return SizedBox.fromSize(
        size: const Size.square(80.0), child: Lottie.asset(path));
  }
}

class WelcomeScreenHint extends StatelessWidget {
  const WelcomeScreenHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 2.0,
            child: const BuildText(
                data: LocaleKeys.welcomeHint,
                color: Colors.black54,
                textAlign: TextAlign.center,
                size: 18.0)));
  }
}
