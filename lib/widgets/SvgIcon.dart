import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends SvgPicture {
  SvgIcon.asset(
    String assetUrl, {
    double size = 24.0,
    Color color = Colors.white,
  }) : super.asset(
          assetUrl,
          width: size,
          height: size,
          color: color,
        );
}
