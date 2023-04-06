import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/SvgIcon.dart';
import 'package:visipay/widgets/button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Stack(

        children: [
          //vector up
          // Transform.translate(
          //   offset: Offset(MediaQuery.of(context).size.width*0.2, -80),
          //   child: SvgPicture.asset(
          //    'images/vector.svg',
          //             ),
          // ),
          Padding(
            padding: const EdgeInsets.all(42.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               

                // Image.asset('images/on-boarding-hero.png'),

                SizedBox(height: 41),
                
                Text(
                  'Akses Transaksimu Dengan Mudah',
                  style:
                      GoogleFonts.nunito(
                        textStyle: Nunito_17px,
                        fontWeight: FontWeight.normal
                      ),
                ),
                
                SizedBox(height: 24),
                
                Text(
                  'Nikmati berbagai layanan finansial dan kemudahan pembayaran dalam genggaman.',
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_17px,
                    fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Button("Lanjutkan", onTap: () {
          Navigator.of(context).pushNamed('/login');
        },)
      )
    );
  }
}
