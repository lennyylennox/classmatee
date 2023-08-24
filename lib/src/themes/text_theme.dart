import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:classmate/src/constants/colors.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: tDarkColor, fontSize: 28, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        color: tDarkColor, fontSize: 24, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.montserrat(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.montserrat(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.montserrat(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.montserrat(
        color: tDarkColor, fontSize: 14, fontWeight: FontWeight.normal),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: tWhiteColor, fontSize: 28, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(
        color: tWhiteColor, fontSize: 24, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.montserrat(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.montserrat(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.montserrat(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.montserrat(
        color: tWhiteColor, fontSize: 14, fontWeight: FontWeight.normal),
  );
}
