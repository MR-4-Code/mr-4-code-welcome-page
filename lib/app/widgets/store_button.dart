import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palstore_welcome_page/core/constants/assets_keys.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';

class StoreButton extends StatelessWidget {
  final String? link;
  final String image;

  const StoreButton({Key? key, this.link, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.download_for_offline;
    Color iconColor = Colors.grey;
    String title = '';

    if (image == Assets.playStore) {
      icon = Icons.android;
      title = 'Android';
      iconColor = Colors.green;
    } else if (image == Assets.appStore) {
      icon = Icons.apple;
      title = 'App Store';
      iconColor = Colors.black;
    } else {
      icon = Icons.storefront;
      title = 'App Gallery';
      iconColor = Colors.pinkAccent;
    }
    return TextButton(
        onPressed: link == null
            ? null
            : () {
                LauncherUtils.to(link!);
              },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 10.0),
            Text(title,
                style: GoogleFonts.actor(
                    fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ));
  }
}
