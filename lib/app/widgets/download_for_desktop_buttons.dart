import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      children: [
        _DownloadButtons(
          icon: FontAwesomeIcons.microsoft,
          title: 'Windows',
          link: StoreLinks.windowsLink,
        ),
        _DownloadButtons(
          icon: FontAwesomeIcons.apple,
          title: 'MacOS',
          link: StoreLinks.macOSLink,
        )
      ],
    );
  }
}

class _DownloadButtons extends StatefulWidget {
  const _DownloadButtons(
      {required this.icon, required this.title, required this.link});

  final IconData icon;
  final String title;
  final String link;

  @override
  State<_DownloadButtons> createState() => _DownloadForDesktopButtonsState();
}

class _DownloadForDesktopButtonsState extends State<_DownloadButtons> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        _updateState = true;
      },
      onExit: (event) {
        _updateState = false;
      },
      child: TextButton(
          style: ButtonStyle(
            side: hover
                ? const WidgetStatePropertyAll(
                    BorderSide(color: Palette.lightGreen))
                : null,
          ),
          onPressed: () {
            LauncherUtils.to(widget.link);
          },
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon,
                    color: hover ? Colors.blueAccent : Palette.lightGreen,
                    size: 45.0),
                const Space.horizontal(5.0),
                BuildText(
                    data: widget.title,
                    size: 18.0,
                    fontWeight: FontWeight.bold),
              ])),
    );
  }

  set _updateState(bool state) {
    hover = state;
    setState(() {});
  }
}
