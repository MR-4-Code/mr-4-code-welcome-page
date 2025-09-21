import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';
import 'package:palstore_welcome_page/core/constants/store_links.dart';
import 'package:palstore_welcome_page/core/presentation/style/palette.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';

import 'build_text.dart';
import 'space.dart';

class DownloadForDesktopButtons extends StatelessWidget {
  const DownloadForDesktopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      alignment: WrapAlignment.center,
      children: [
        DownloadButton(
          icon: FontAwesomeIcons.microsoft,
          title: 'Windows',
          link: StoreLinks.windowsLink,
        ),
        DownloadButton(
          icon: FontAwesomeIcons.apple,
          title: 'MacOS',
          isComingSoon: true,
          link: StoreLinks.macOSLink,
        )
      ],
    );
  }
}

class DownloadButton extends StatefulWidget {
  const DownloadButton(
      {super.key,
      required this.icon,
      this.isComingSoon = false,
      required this.title,
      required this.link});

  final IconData icon;
  final String title;
  final String link;
  final bool isComingSoon;

  @override
  State<DownloadButton> createState() => _DownloadForDesktopButtonsState();
}

class _DownloadForDesktopButtonsState extends State<DownloadButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.isComingSoon ? LocaleKeys.comingSoonOn.tr : '',
      child: MouseRegion(
        onHover: (event) {
          _updateState = true;
        },
        onExit: (event) {
          _updateState = false;
        },
        child: OutlinedButton(
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
              side: hover
                  ? const WidgetStatePropertyAll(
                      BorderSide(color: Palette.lightGreen))
                  : null,
            ),
            onPressed: widget.isComingSoon
                ? null
                : () {
                    LauncherUtils.to(widget.link);
                  },
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon,
                      color: hover ? Colors.blueAccent : null, size: 45.0),
                  const Space.horizontal(15.0),
                  BuildText(
                      data: widget.title,
                      size: 18.0,
                      fontWeight: FontWeight.bold),
                ])),
      ),
    );
  }

  set _updateState(bool state) {
    hover = state;
    setState(() {});
  }
}
