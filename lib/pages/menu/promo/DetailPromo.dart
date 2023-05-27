import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';

class DetailPromo extends StatefulWidget {
  const DetailPromo({super.key});

  @override
  State<DetailPromo> createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {
  final TextEditingController __DetailPromoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, "/daftarpromo");
            },
          ),
          title: Text("Detail Promo",
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.discount),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    'Promo Cashback 5%',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_21px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Dapatkan cashback 5% ketika menggunakan Debit BCA untuk berbelanja setiap hari. Hanya berlaku di jam 15.00 - 23.00 WIB!',
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w300,
                                  color: Text1,
                                ),
                              ),
                              SizedBox(height: 16),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Promo dapat digunakan untuk transaksi',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    ),
                                  ),
                                  Text(
                                    '1. Pulsa Telkomsel\n2. Pulsa Indosat\n3. Paket Data Telkomsel\n4. Paket Data Indosat',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
