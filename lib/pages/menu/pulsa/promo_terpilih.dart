import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/widgets/button.dart';
import 'package:visipay/widgets/container.dart';
import 'package:visipay/pages/menu/pulsa/pulsapaket.dart';

class PromoTerpilih extends StatefulWidget {
  const PromoTerpilih({super.key});

  @override
  State<PromoTerpilih> createState() => _PromoTerpilihState();
}

class _PromoTerpilihState extends State<PromoTerpilih> {
  final TextEditingController __PromoTerpilihController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: Semantics(
            label: "Kembali",
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
            ),
          ),
          title: Text("Konfirmasi Pembayaran",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 20),
            Card(
              color: Color(0xffEEEEEE),
              // padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Telkomsel',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        Text(
                          '081377618232',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w500,
                            color: Text1,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp. 5.000',
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.w500,
                        color: Text1,
                      ),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Metode Pembayaran',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0), // Menambahkan padding horizontal
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Visipay',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        Text(
                          'Saldo: Rp. 21.054.380',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w300,
                            color: Color(0xffC20025),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Refresh',
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.w700,
                        color: Primary90,
                      ),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Promo & Voucher',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Card(
              color: Color(0xffF1F6F9),
              child: Column(
                children: [
                  OutlinedBox(
                    child: Padding(
                      padding:
                          EdgeInsets.all(8.0), // Menambahkan padding horizontal
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Membuat child berada di ujung kiri dan ujung kanan
                        children: [
                          IconButton(
                            icon: Icon(Icons.discount),
                            color: Secondary50,
                            onPressed: () {},
                          ),
                          Text(
                            'Voucher Bulan Mei',
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.w700,
                              color: Secondary50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ]),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedBox(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              backgroundColor: Color(0xffF1F6F9),
              child: Padding(
                padding: EdgeInsets.all(16.0), // Menambahkan padding horizontal
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Total Bayar',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        Text(
                          'Rp. 0',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w500,
                            color: Text1,
                          ),
                        ),
                      ],
                    ),
                    Button(
                      "Bayar",
                      backgroundColor: Secondary50,
                      width: 123,
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
