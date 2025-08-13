import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocabulift/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? faded;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.faded,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: faded == true ? colors["fontColor"]!.withAlpha(128) : colors["fontColor"]!,
        fontFamily: GoogleFonts.lexend().fontFamily,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontStyle: faded == true ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
