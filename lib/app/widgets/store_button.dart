import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palstore_welcome_page/core/constants/assets_keys.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';

class StoreButton extends StatefulWidget {
  final String? link;
  final String image;

  const StoreButton({super.key, this.link, required this.image});

  @override
  State<StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<StoreButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.download_for_offline;
    Color iconColor = Colors.grey;
    String title = '';

    if (widget.image == Assets.playStore) {
      icon = FontAwesomeIcons.googlePlay;
      title = 'Android';
      iconColor = Colors.green;
    } else if (widget.image == Assets.appStore) {
      icon = FontAwesomeIcons.appStoreIos;
      title = 'App Store';
      iconColor = Colors.black;
    } else {
      icon = Icons.storefront;
      title = 'App Gallery';
      iconColor = Colors.pinkAccent;
    }
    return OutlinedButton(
        onHover: (value) {
          hover = value;
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                widget.link == null ? Colors.black26 : null),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: hover
                    ? const BorderSide(color: Colors.amberAccent)
                    : BorderSide.none))),
        onPressed: widget.link == null
            ? null
            : () {
                LauncherUtils.to(widget.link!);
              },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 10.0),
            Text(title,
                style:
                    GoogleFonts.quicksand(fontSize: 18.0, color: Colors.white)),
          ],
        ));
  }
}
