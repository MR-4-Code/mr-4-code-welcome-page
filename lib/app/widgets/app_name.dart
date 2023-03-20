import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/presentation/style/palette.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const logoTextSize = 120.0;

    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Pal',
          style: GoogleFonts.bebasNeue(
              color: Palette.offWhite,
              fontSize: logoTextSize,
              fontWeight: FontWeight.bold)),
      TextSpan(
          text: ' Store',
          style: GoogleFonts.dancingScript(
            color: Palette.white,
            fontSize: logoTextSize - 15.0,
          ))
    ]));
  }
}
