import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  final serverHeading = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final groupHeading = GoogleFonts.inter(
    color: Color.fromRGBO(255, 255, 255, 0.5),
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  final channelHeadingSelected = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final channelHeadingUnselected = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.6),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final chatHintStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.2),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final chatStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.8),
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  final chatUndelivered = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.5),
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  final usernameStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.9),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final chatDateStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final chatHeaderStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.7),
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );
  final jumpToPresentStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.7),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final serverItemLeading = GoogleFonts.openSans(
    color: ColorPalette.serverItemLeading,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final chatDeletedStyle = GoogleFonts.openSans(
    color: Color.fromRGBO(255, 255, 255, 0.5),
    fontWeight: FontWeight.normal,
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );
}
