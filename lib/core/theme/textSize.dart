import 'package:flutter/material.dart';
import 'package:visipay/core/theme/palette.dart';

class TextSize {
  static TextStyle get headline1 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 51.0,
    color: Palette.textColor,
  );

  static TextStyle get headline2 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 36.0,
    color: Palette.textColor,
  );

  static TextStyle get headline3 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 51.0,
    color: Palette.textColor,
  );

  static TextStyle get subtitle1 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 21.0,
    color: Palette.textColor,
  );

  static TextStyle get subtitle2 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 17.0,
    color: Palette.textColor,
  );

  static TextStyle get body1 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
    color: Palette.textColor,
  );

  static TextStyle get body2 => const TextStyle(
    fontFamily: "Nunito",
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
    color: Palette.textColor,
  );
}