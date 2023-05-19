import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palstore_welcome_page/core/constants/locale_keys.dart';
import 'package:palstore_welcome_page/core/constants/store_links.dart';
import 'package:palstore_welcome_page/core/presentation/style/palette.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';

import 'build_text.dart';
import 'space.dart';

class DownloadForWindowsButton extends StatefulWidget {
  const DownloadForWindowsButton({Key? key}) : super(key: key);

  @override
  State<DownloadForWindowsButton> createState() =>
      _DownloadForWindowsButtonState();
}

class _DownloadForWindowsButtonState extends State<DownloadForWindowsButton> {
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
                ? const MaterialStatePropertyAll(
                    BorderSide(color: Palette.lightGreen))
                : null,
          ),
          onPressed: () {
            LauncherUtils.to(StoreLinks.windowsLink);
          },
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.windows,
                    color: hover ? Colors.blueAccent : Palette.lightGreen,
                    size: 45.0),
                const Space.horizontal(5.0),
                const BuildText(
                    data: LocaleKeys.downloadForWindows,
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
