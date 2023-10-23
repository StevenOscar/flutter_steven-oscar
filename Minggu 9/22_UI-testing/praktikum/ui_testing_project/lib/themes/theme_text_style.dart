import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_colors.dart';

class ThemeTextStyles {
  TextStyle headlineLarge = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 46,
    color: Colors.white,
    letterSpacing: 0.6,
  );
  TextStyle headlineLargeOrange = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 46,
    color: Colors.deepOrange[400],
    letterSpacing: 0.6,
  );
  TextStyle headlineMediumWhite = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.white,
    letterSpacing: 0.6,
  );
  TextStyle headlineMediumBlack = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.black,
    letterSpacing: 0.6,
  );
  TextStyle headlineSmallBlack = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
    letterSpacing: 0.6,
  );
  TextStyle bodyLarge = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    color: Colors.white,
    letterSpacing: 0.6,
  );
  TextStyle bodyMediumNormalWhite = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Colors.white,
    letterSpacing: 0.8,
    height: 1.8
  );
  TextStyle bodyMediumNormalBlack = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Colors.black,
    letterSpacing: 0.8,
    height: 1.8
  );
  TextStyle bodyMediumShort = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Colors.white,
    letterSpacing: 0.6,
    height: 1.2
  );
  TextStyle bodySmallBlack = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,
    letterSpacing: 0.5,
    height: 1.3
  );

  TextStyle bodySmallWhite = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
    letterSpacing: 0.5,
    height: 1.3
  );

  TextStyle m3HeadlineLarge = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color : const Color(0xFF000000)
  );
  TextStyle m3HeadlineMedium = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color : const Color(0xFF000000),
  );
  TextStyle m3HeadlineSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color : ThemeColors().m3SysLightOnSurface
  );
  TextStyle m3BodyLargeTextField = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color : Colors.black,
    letterSpacing: 0.5
  );
  TextStyle m3BodyLargeListView = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color : ThemeColors().m3SysLightOnSurface,
    letterSpacing: 0.5
  );
  TextStyle m3BodyLargeText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color : ThemeColors().m3SysLightPrimary,
    letterSpacing: 0.5
  );
  TextStyle m3BodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color : ThemeColors().m3SysLightOnSurfaceVariant,
    height: 1.43
  );
  TextStyle m3BodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color : ThemeColors().m3SysLightOnSurfaceVariant,
    letterSpacing: 0.4,
    height: 1.3
  );
  TextStyle m3TitleMedium = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color : ThemeColors().m3SysLightOnPrimaryContainer,
    letterSpacing: 0.15
  );
  TextStyle m3TitleSmall = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color : ThemeColors().m3SysLightPrimary,
    letterSpacing: 0.1
  );
  TextStyle m3LabelLarge = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color : ThemeColors().m3SysLightOnPrimary,
    letterSpacing: 0.1,
    height: 1.43
  );
}