// ignore_for_file: unused_field, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/widgets/cardPulsa.dart';

class PulsaPaket extends StatefulWidget {
  // String? inputNumber;
  const PulsaPaket({super.key});

  @override
  State<PulsaPaket> createState() => _PulsaPaketState();
}

class _PulsaPaketState extends State<PulsaPaket> {

  String inputNumber = "";

  void onFieldSubmitted(String value) {
    setState(() {
      inputNumber = value;
    });
  }
  final TextEditingController __PulsaPaketController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Primary50,
                leading: Semantics(
                  label: "Kembali ke beranda",
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
                title: Text("Pulsa & Paket Data",
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextFormField(
                      onFieldSubmitted: onFieldSubmitted,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // prefixText: "Rp ",
                        labelText: 'Nomor Telfon',
                        hintText: 'Masukkan Nomor Telfon',
                        // prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Primary30),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),

                  Container(
                  // color: Colors.green,
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Text(
                    "Transaksi Terakhir",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                        textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  child: SizedBox(
                    // width: 380,
                    height: 76,
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icon/History.png",
                                    width: 34,
                                    height: 34,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pulsa Telkomsel",
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Rp 100000",
                                        style: GoogleFonts.nunito(
                                            textStyle: Nunito_13px,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "Beli Lagi",
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_15px,
                                    fontWeight: FontWeight.bold,
                                    color: Primary50),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                  TabBar(
                    padding: EdgeInsets.only(bottom: 8),
                    indicatorColor: Primary50,
                    tabs: [
                      Tab(
                        child:
                            Text('PULSA', style: TextStyle(color: Primary50)),
                      ),
                      Tab(
                        child: Text('PAKET DATA',
                            style: TextStyle(color: Primary50)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        inputNumber != "" ? 
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                CardPulsa(harga: 5000),
                                CardPulsa(harga: 10000),
                                CardPulsa(harga: 25000),
                                CardPulsa(harga: 50000),
                                CardPulsa(harga: 75000),
                                CardPulsa(harga: 100000),
                                CardPulsa(harga: 150000),
                              ],
                            ),
                          ),
                        )
                         : Center(child: Text("Input Nomor Telfon"))
                        // if (widget.inputNumber != null)){
                        //   SingleChildScrollView(
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 16),
                        //     child: Column(
                        //       children: [
                        //         CardPulsa(harga: 5000),
                        //         CardPulsa(harga: 10000),
                        //         CardPulsa(harga: 25000),
                        //         CardPulsa(harga: 50000),
                        //         CardPulsa(harga: 75000),
                        //         CardPulsa(harga: 100000),
                        //         CardPulsa(harga: 150000),
                        //       ],
                        //     ),
                        //   ),
                        // )
                        // }
                        ,
                        Center(
                          child: Text("Paket Data Tidak Tersedia"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
