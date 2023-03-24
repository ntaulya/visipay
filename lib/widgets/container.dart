import 'package:flutter/material.dart';

class OutlinedBox extends Container {
  OutlinedBox({
    Key? key,
    Color backgroundColor = Colors.transparent,
    Color borderColor = Colors.transparent,
    Color shadowColor = Colors.transparent,
    BorderRadiusGeometry? borderRadius,
    double borderWidth = 1.0,
    required Widget child,
    double? height,
    double? width,
    EdgeInsets? padding,
  }) : super(
          key: key,
          child: child,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: borderWidth,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            color: backgroundColor,
            shape: BoxShape.rectangle,
          ),
          width: width,
          height: height,
          padding: padding,
        );
}
