import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palstore_welcome_page/core/constants/store_links.dart';
import 'package:palstore_welcome_page/core/presentation/style/palette.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';
import 'package:url_launcher/url_launcher.dart';

const _authorText = '2025 \u00a9 Author MrDev, Inc.';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAuthorText(),
          _buildSocialRow(),
        ],
      ),
    );
  }

  Widget _buildAuthorText() {
    return InkWell(
      onTap: () {
        LauncherUtils.to(StoreLinks.orgSite);
      },
      child: Text(
        _authorText,
        style: GoogleFonts.nunito(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSocialRow() {
    return Row(
      children: [
        _buildLoginButton(),
        _buildFacebookButton(),
        _buildInstagramButton(), // New Instagram button
        _buildEmailButton(),
      ],
    );
  }

  Widget _buildLoginButton() {
    return IconButton(
      onPressed: () {
        LauncherUtils.to(StoreLinks.webAppLogin);
      },
      icon: const Icon(Icons.login),
      color: Palette.dClassicSecondary,
    );
  }

  Widget _buildFacebookButton() {
    return IconButton(
      onPressed: () {
        LauncherUtils.to(StoreLinks.facebookUri);
      },
      icon: const FaIcon(FontAwesomeIcons.facebook),
      color: Colors.blueAccent,
    );
  }

  Widget _buildInstagramButton() {
    return IconButton(
      onPressed: () {
        LauncherUtils.to(
            StoreLinks.instagramUri); // Add `instagramUri` to `StoreLinks`
      },
      icon: const FaIcon(FontAwesomeIcons.instagram),
      color: Colors.pink,
    );
  }

  Widget _buildEmailButton() {
    return IconButton(
      onPressed: () {
        launchUrl(Uri.parse('mailto:mrdev.ps@gmail.com'));
      },
      icon: const FaIcon(FontAwesomeIcons.envelope),
      color: Colors.red,
    );
  }
}
