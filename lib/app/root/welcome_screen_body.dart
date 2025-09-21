import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:palstore_welcome_page/app/widgets/download_for_desktop_buttons.dart';
import 'package:palstore_welcome_page/app/widgets/more_details/more_details_about_palstore.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';

import '/app/widgets/build_main_app_bar.dart';
import '/core/constants/assets_keys.dart';
import '/core/constants/store_links.dart';
import '/core/presentation/style/palette.dart';
import '../widgets/app_name.dart';
import '../widgets/build_text.dart';
import '../widgets/footer.dart';
import '../widgets/space.dart';

const double radius = 35.0;
final borderRadius = BorderRadius.circular(radius);

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    const secondContainerRadius = Radius.circular(radius);
    double margin = MediaQuery.of(context).size.width < 800 ? 20.0 : 40.0;
    return Scaffold(
      backgroundColor: Palette.dClassicPrimary,
      body: Card(
        margin: EdgeInsets.all(margin),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: const BorderSide(color: Palette.white, width: 2)),
        elevation: 15.0,
        shadowColor: Palette.lightGreen,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Palette.dClassicSecondary)),
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
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10.0,
                              children: [
                            AppName(),
                            WelcomeScreenHint(),
                            BuildText(
                              data: LocaleKeys.merchantApp,
                            ),
                            DownloadForDesktopButtons(),
                            Space.vertical(25.0),
                            StoreButtons(),
                            MoreDetailsAboutPalStore()
                          ])),
                    ),
                  ),
                  WelcomeAnim(),
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
  const StoreButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15.0,
      children: [
        BuildText(data: LocaleKeys.downloadForMobile, size: 16.0),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          alignment: WrapAlignment.start,
          children: [
            DownloadButton(
              link: StoreLinks.playStore,
              icon: FontAwesomeIcons.googlePlay,
              title: 'GooglePaly',
            ),
            DownloadButton(
              link: StoreLinks.appStore,
              icon: FontAwesomeIcons.appStore,
              title: 'App Store',
            ),
            DownloadButton(
              link: StoreLinks.appGallery,
              icon: FontAwesomeIcons.store,
              title: 'App Gallery',
              isComingSoon: true,
            ),
          ],
        ),
        Space.vertical(10.0),
        Space.vertical(10.0),
      ],
    );
  }
}

class WelcomeAnim extends StatelessWidget {
  const WelcomeAnim({super.key});

  @override
  Widget build(BuildContext context) {
    const path = 'images/${Assets.welcomeAnim}.json';
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox.fromSize(
          size: const Size.square(100.0),
          child: Lottie.asset(path, width: 100, height: 100, fit: BoxFit.fill)),
    );
  }
}

class WelcomeScreenHint extends StatelessWidget {
  const WelcomeScreenHint({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildText(
        data: LocaleKeys.welcomeHint,
        color: Colors.black54,
        textAlign: TextAlign.center,
        size: 18.0);
  }
}
