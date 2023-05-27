// ignore_for_file: unused_field, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

class PulsaPaket extends StatefulWidget {
  const PulsaPaket({super.key});

  @override
  State<PulsaPaket> createState() => _PulsaPaketState();
}

class _PulsaPaketState extends State<PulsaPaket> {
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
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                title: Text("Pulsa & Paket Data",
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
              ),
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextFormField(
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
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                  child: ListTile(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 400,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 32.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Informasi Pelanggan',
                                                    style: GoogleFonts.nunito(
                                                      textStyle: Nunito_17px,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Text1,
                                                    )),
                                                SizedBox(height: 18),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('No Ponsel',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text('123456789',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Text1,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Pulsa',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text('Rp 5.000',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Text1,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 18),
                                                Row(
                                                  children: [
                                                    Text('Detail Pembayaran',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_17px,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Text1,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 18),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Harga Pulsa',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text('Rp 5.000',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Text1,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Biaya Transaksi',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text('Rp 1.000',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Text1,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Divider(
                                                  color: Color(
                                                      0xff3A3541), // Warna garis
                                                  thickness:
                                                      1.0, // Ketebalan garis
                                                ),
                                                SizedBox(height: 14),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Total Pembayaran',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Text1,
                                                        )),
                                                    Text('Rp 6.000',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Text1,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(height: 14),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Button(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      "Ubah",
                                                      backgroundColor:
                                                          Primary50,
                                                      width: 151,
                                                      height: 48,
                                                    ),
                                                    Button(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  KonfirPulsa(),
                                                            ));
                                                      },
                                                      "Konfirmasi",
                                                      backgroundColor:
                                                          Secondary50,
                                                      width: 151,
                                                      height: 48,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });

                                      
                                },
                                title: Text('Rp 5.000',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w700,
                                      color: Text1,
                                    )),
                                subtitle: Text('Harga Rp 6.000',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_15px,
                                      fontWeight: FontWeight.w500,
                                      color: Text1,
                                    )),
                              )),
                            ],
                          ),
                        ),
                        Center(
                          child: Text("It's rainy here"),
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
