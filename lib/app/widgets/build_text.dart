import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  final String data;

  final Color? color;

  final double? size;

  final FontWeight? fontWeight;

  final TextAlign? textAlign;

  const BuildText(
      {super.key,
      required this.data,
      this.color,
      this.size,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      data.tr,
      textAlign: textAlign,
      style: GoogleFonts.cairo(
          color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
