import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/palette.dart';
import '../core/theme/textSize.dart';

class CardButton extends StatelessWidget {
  final String? image;
  final String? text;
  final Widget Function(BuildContext)? route;
  final VoidCallback? onTap;
  const CardButton({this.image, this.text, this.route, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 150,
      child: Card(
        shadowColor: Colors.black,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap ?? () {
            if (route != null) {
              Navigator.push(context, MaterialPageRoute(builder: route!));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image!,
                height: 48,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                text!,
                style: GoogleFonts.nunito(
                  textStyle: Nunito_17px,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
