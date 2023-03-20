import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';

import '../../core/constants/assets_keys.dart';
import '../../core/constants/store_links.dart';
import '../../core/presentation/style/palette.dart';
import '../widgets/app_name.dart';
import '../widgets/build_text.dart';
import '../widgets/store_button.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Palette.lightGreen),
        child: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(color: Palette.lightGreen)),
            Container(
                decoration: const BoxDecoration(
                    color: Palette.appbarBackground,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(1000)))),
            const Positioned(
              right: 20,
              bottom: 100,
              child: StoreButtons(),
            ),
            Positioned(
                top: 30,
                left: 100,
                child: Column(
                  children: const [
                    AppName(),
                    DownloadForDesktop(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class DownloadForDesktop extends StatelessWidget {
  const DownloadForDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        LauncherUtils.to(StoreLinks.windowsLink);
      },
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.install_desktop_outlined,
                color: Palette.lightGreen, size: 45.0),
            BuildText(
                data: 'Download For windows',
                size: 25.0,
                color: Palette.white,
                fontWeight: FontWeight.bold),
          ]),
    );
  }
}

class StoreButtons extends StatelessWidget {
  const StoreButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StoreButton(link: StoreLinks.playStore, image: Assets.playStore),
        const BuildText(
            data: 'Coming Soon on', size: 25.0, color: Palette.white),
        Row(
          children: const [
            StoreButton(image: Assets.appGallery),
            StoreButton(image: Assets.appStore),
          ],
        )
      ],
    );
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
