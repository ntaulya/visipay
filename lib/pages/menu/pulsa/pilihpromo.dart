import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/button.dart';
import 'package:visipay/widgets/card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PilihPromo extends StatefulWidget {
  const PilihPromo({super.key});

  @override
  State<PilihPromo> createState() => _PilihPromoState();
}

class _PilihPromoState extends State<PilihPromo> {
  final TextEditingController __PilihPromoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Text("Pilih Promo",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Column(children: [
          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Voucher Bulan Mei',
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_17px,
                                fontWeight: FontWeight.w700,
                                color: Text1,
                              ),
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Convallis velit imperdiet volutpat massa vel ut mauris quisque.',
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Aksi saat tombol ditekan
                          },
                          child: Text("Pilih"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            )
          ],
        ),
      )),
    );
  }
}
