import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/presentation/style/palette.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    const logoTextSize = 80.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Pal',
                style: GoogleFonts.bebasNeue(
                    color: Palette.dClassicSecondary,
                    fontSize: logoTextSize,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: ' Store',
                style: GoogleFonts.dancingScript(
                  color: Palette.dClassicSecondary,
                  fontSize: logoTextSize - 15.0,
                ))
          ])),
        ],
      ),
    );
  }
}
