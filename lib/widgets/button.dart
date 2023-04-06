import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/container.dart';
import 'package:visipay/widgets/item_button.dart';

class Button extends GestureDetector {
  Button(
    String text, {
    super.key,
    Color? backgroundColor,
    // Color borderColor,
    Color? color,
    EdgeInsets? padding,
    double? height,
    double? width,
    double? borderRadius,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextStyle? textStyle,
    VoidCallback? onTap,
  }) : super(
          onTap: onTap,
          child: OutlinedBox(
            backgroundColor: backgroundColor ?? Primary50,
            // borderColor: borderColor??,
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
            height: height,
            width: width,
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ItemButton(
              textStyle: GoogleFonts.nunito(),
              text: text,
              color: color ?? Primary50,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        );
}
