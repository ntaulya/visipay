import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

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
          leading: Semantics(
            label: "Kembali ke halaman konfirmasi",
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KonfirPulsa(),
                    ));
              },
            ),
          ),
          title: Text("Pilih Promo",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
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
                          ),
                          Button(
                            "Pilih",
                            backgroundColor: Secondary50,
                            width: 70,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Membuat teks berada di ujung kiri dan ujung kanan
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Promo Lainnya',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.w600,
                            color: Text1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Color(0xffEEEEEE),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.discount),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    'Cashback 5%',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_15px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Promo hanya berlaku di jam 15.00 - 23.00 WIB',
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
                                    fontWeight: FontWeight.w300,
                                    color: Text1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Color(0xffEEEEEE),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.discount),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    'Cashback 5%',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_15px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Promo hanya berlaku di jam 15.00 - 23.00 WIB',
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
                                    fontWeight: FontWeight.w300,
                                    color: Text1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Color(0xffEEEEEE),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.discount),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    'Cashback 5%',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_15px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Promo hanya berlaku di jam 15.00 - 23.00 WIB',
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
                                    fontWeight: FontWeight.w300,
                                    color: Text1),
                              ),
                            ],
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
