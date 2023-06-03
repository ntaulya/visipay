import 'dart:ffi';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

class CardToken extends StatefulWidget {
  final String? heading;
  final int harga;
  const CardToken({this.heading, required this.harga});

  @override
  State<CardToken> createState() => _CardTokenState();
}

class _CardTokenState extends State<CardToken> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                          width: 180,
                          height: 130,
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                     showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 430,
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
                                                    Text('ID Pelanggan',
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
                                                    Text('Nama Pelanggan',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text('HAM',
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
                                                    Text('Tarif/Daya',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text('R1/000001300VA',
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
                                                    Text('Harga Token',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_15px,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Text1,
                                                        )),
                                                    Text("Rp "+ (widget.harga-2500).toString(),
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
                                                    Text('Rp 2500',
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
                                                    Text("Rp " + (widget.harga).toString(),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.heading!,
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700,
                                    color: Text1
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp " + (widget.harga).toString(),
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
  }
}