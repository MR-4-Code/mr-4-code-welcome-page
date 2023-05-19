import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palstore_welcome_page/core/constants/store_links.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';
import 'package:url_launcher/url_launcher.dart';

const _authorText = ' 2023 \u00a9 Author MrDev ,Inc.';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_authorText,
            style: GoogleFonts.nunito(fontSize: 12.0, color: Colors.white)),
        _socialRow,
      ],
    );
  }

  Widget get _socialRow {
    return Row(
      children: [faceBook, email],
    );
  }

  Widget get faceBook {
    return IconButton(
        onPressed: () {
          LauncherUtils.to(StoreLinks.facebookUri);
        },
        icon: Icon(FontAwesomeIcons.facebook));
  }

  Widget get email {
    return IconButton(
        onPressed: () {
          launchUrl(Uri.parse('mailto:mrdev.ps@gmail.com'));
        },
        icon: Icon(FontAwesomeIcons.envelope));
  }
}
