import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle heading = GoogleFonts.nunitoSans(
    textStyle: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
  );

  static TextStyle appbarStyle =
      GoogleFonts.nunitoSans(textStyle: const TextStyle(fontSize: 14));

  static TextStyle font12Bold = GoogleFonts.nunitoSans(
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800));

  static TextStyle font12Regular = GoogleFonts.nunitoSans(
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600));
}
