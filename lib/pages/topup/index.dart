import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';

class IndexTopUp extends StatelessWidget {
  TextEditingController eController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 63.0,
            color: Primary50,
          child: Row(children: [
            
            SizedBox(
              width: 16.0,
            ),
            
            Icon(
              Icons.arrow_back,
              size: 24.0,
              color: Colors.white,
            ),
            
            SizedBox(
              width: .0,
            ),
            
            Text(
              'Top Up',
              style: GoogleFonts.nunito(
                  textStyle: Nunito_17px,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ]),
        ),

        SizedBox(
          height: 24.0,
        ),

        Text(
          'Jumlah Top Up',
          style: GoogleFonts.nunito(
              textStyle: Nunito_17px,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        )
      ]),
    ));
  }
}
