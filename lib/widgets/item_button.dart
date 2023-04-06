import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/textSize.dart';

// ignore: must_be_immutable
class ItemButton extends StatelessWidget {
  String text;
  TextStyle? textStyle;
  Color color;
  Widget? prefixIcon;
  Widget? suffixIcon;

  ItemButton({
    Key? key,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.text,
    required this.textStyle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        prefixIcon ?? const SizedBox(),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.nunito(
              
            ),
          ),
        ),
        suffixIcon ?? const SizedBox(),
      ],
    );
  }
}
