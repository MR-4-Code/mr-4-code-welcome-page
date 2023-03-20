import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  final String data;

  final Color? color;

  final double? size;

  final FontWeight? fontWeight;

  const BuildText(
      {Key? key, required this.data, this.color, this.size, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.cairo(
          color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
