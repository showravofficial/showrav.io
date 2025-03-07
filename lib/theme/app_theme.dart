import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color primaryColorLight = Color(0xFF0A66C2);
  static const Color secondaryColorLight = Color(0xFFF5F5F5);
  static const Color textColorLight = Color(0xFF2D2D2D);
  static const Color subtitleColorLight = Color(0xFF6E6E6E);
  static const Color backgroundColorLight = Color(0xFFFFFFFF);

  // Dark Theme Colors
  static const Color primaryColorDark = Color(0xFF64FFDA);
  static const Color secondaryColorDark = Color(0xFF0A192F);
  static const Color textColorDark = Color(0xFFCCD6F6);
  static const Color subtitleColorDark = Color(0xFF8892B0);
  static const Color backgroundColorDark = Color(0xFF0A192F);
  
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColorLight,
      scaffoldBackgroundColor: backgroundColorLight,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          color: textColorLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: textColorLight,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: subtitleColorLight,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: subtitleColorLight,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColorLight,
        background: backgroundColorLight,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColorDark,
      scaffoldBackgroundColor: backgroundColorDark,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          color: textColorDark,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: textColorDark,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: subtitleColorDark,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: subtitleColorDark,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColorDark,
        background: backgroundColorDark,
        brightness: Brightness.dark,
      ),
    );
  }

  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? primaryColorDark
        : primaryColorLight;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textColorDark
        : textColorLight;
  }

  static Color getSubtitleColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? subtitleColorDark
        : subtitleColorLight;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? backgroundColorDark
        : backgroundColorLight;
  }

  static Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? secondaryColorDark
        : secondaryColorLight;
  }
} 