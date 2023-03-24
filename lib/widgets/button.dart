import 'package:flutter/material.dart';
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
            backgroundColor: backgroundColor ?? Palette.Primary50,
            // borderColor: borderColor??,
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
            height: height,
            width: width,
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ItemButton(
              text: text,
              color: color ?? Palette.Primary50,
              textStyle: TextSize.body1.apply(color: color ?? Colors.white),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        );
}
