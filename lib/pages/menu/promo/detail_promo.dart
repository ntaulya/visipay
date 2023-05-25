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
  final TextEditingController __DetailPromoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, "/home");
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
                  Card(
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
                                    onPressed: (
                                      
                                    ) {},
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
