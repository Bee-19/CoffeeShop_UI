import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightText extends StatelessWidget {
  double size;
  final String font;
  final String text;
  final Color? color;
  final TextAlign? align;
  TextOverflow textOverflow;
  final FontWeight fontWeight;

  LightText({
    super.key,
    this.size = 20,
    this.align,
    this.textOverflow = TextOverflow.ellipsis,
    this.color,
    this.font = 'Nunito',
    this.fontWeight = FontWeight.bold,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: textOverflow,
      style: GoogleFonts.getFont(
        font,
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }
}
