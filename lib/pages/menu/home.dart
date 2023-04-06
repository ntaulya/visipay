import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
Container(
              color: Primary50,
              width: 375.0,
              height: 165.0,
            ),
            Text('Total Saldo',style: GoogleFonts.nunito(
              textStyle: Nunito_17px,
              fontWeight: FontWeight.normal
            )),
          ]
          ));
  }
}
