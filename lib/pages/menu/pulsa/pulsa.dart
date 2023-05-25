import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

class IndexPulsa extends StatefulWidget {
  const IndexPulsa({super.key});

  @override
  State<IndexPulsa> createState() => _IndexPulsaState();
}

class _IndexPulsaState extends State<IndexPulsa> {
  final TextEditingController __IndexPulsaController = TextEditingController();

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
                  Navigator.pushNamed(context, "/home");
                },
              ),
              title: Text("Pulsa & Paket Data",
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),

            //   bottom: TabBar(
            //     indicatorColor: Primary50,
            //     tabs: [
            //       Tab(
            //         text: "ISI PULSA",
            //       ),
            //       Tab(
            //         text: "PAKET DATA",
            //       ),
            //     ],
            //   ),
            // ),
            // body: 
            // TabBarView(
            //   children: [
            //     Center(child: Text("It's rainy here")),
            //     Center(
            //       child: Text("It's rainy here"),
            //     ),
            //   ],
            // ),

            

            // SizedBox(height: 16),

            // SizedBox(height: 16),
            // DefaultTabController(
            //   length: 2,
            //   child: Column(children: [
            //     TabBar(
            //       tabs: [
            //         Tab(
            //           child:
            //               Text('ISI PULSA', style: TextStyle(color: Primary50)),
            //         ),
            //         Tab(
            //           child: Text('PAKET DATA', style: TextStyle(color: Text2)),
            //         ),
            //       ],
            //     ),
            //   ]),
            // ),
            // SizedBox(height: 12),
            // Card(
            //     child: Column(
            //   children: [
            //     ListTile(
            //       onTap: () {
            //         showModalBottomSheet(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return Container(
            //                 height: 380,
            //                 child: Container(
            //                   padding: EdgeInsets.symmetric(
            //                       horizontal: 16.0, vertical: 32.0),
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text('Informasi Pelanggan',
            //                           style: GoogleFonts.nunito(
            //                             textStyle: Nunito_17px,
            //                             fontWeight: FontWeight.w700,
            //                             color: Text1,
            //                           )),
            //                       SizedBox(height: 18),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('No Ponsel',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w500,
            //                                 color: Text1,
            //                               )),
            //                           Text('0895330683880',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w600,
            //                                 color: Text1,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('Voucher Tri',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w500,
            //                                 color: Text1,
            //                               )),
            //                           Text('Rp. 5.000',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w600,
            //                                 color: Text1,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(height: 18),
            //                       Row(
            //                         children: [
            //                           Text('Detail Pembayaran',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_17px,
            //                                 fontWeight: FontWeight.w700,
            //                                 color: Text1,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(height: 18),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('Harga Voucher',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w500,
            //                                 color: Text1,
            //                               )),
            //                           Text('Rp. 5.000',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w600,
            //                                 color: Text1,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('Biaya Transaksi',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w500,
            //                                 color: Text1,
            //                               )),
            //                           Text('Rp. 2.000',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w600,
            //                                 color: Text1,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(height: 12),
            //                       Divider(
            //                         color: Color(0xff3A3541), // Warna garis
            //                         thickness: 1.0, // Ketebalan garis
            //                       ),
            //                       SizedBox(height: 14),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('Total Pembayaran',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w700,
            //                                 color: Text1,
            //                               )),
            //                           Text('Rp. 7.000',
            //                               style: GoogleFonts.nunito(
            //                                 textStyle: Nunito_15px,
            //                                 fontWeight: FontWeight.w700,
            //                                 color: Text1,
            //                               )),
            //                         ],
            //                       ),
            //                       SizedBox(height: 14),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Button(
            //                             "Ubah",
            //                             backgroundColor: Primary50,
            //                             width: 151,
            //                             height: 48,
            //                           ),
            //                           Button(
            //                             "Konfirmasi",
            //                             backgroundColor: Secondary50,
            //                             width: 151,
            //                             height: 48,
            //                           ),
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             });
            //       },
            //       title: Text('Rp. 5.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_17px,
            //             fontWeight: FontWeight.w700,
            //             color: Text1,
            //           )),
            //       subtitle: Text('Total : Rp. 6.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_15px,
            //             fontWeight: FontWeight.w500,
            //             color: Text1,
            //           )),
            //     ),
            //   ],
            // )),
            // SizedBox(height: 12),
            // Card(
            //     child: Column(
            //   children: [
            //     ListTile(
            //       title: Text('Rp. 10.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_17px,
            //             fontWeight: FontWeight.w700,
            //             color: Text1,
            //           )),
            //       subtitle: Text('Total : Rp. 11.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_15px,
            //             fontWeight: FontWeight.w500,
            //             color: Text1,
            //           )),
            //     ),
            //   ],
            // )),
            // SizedBox(height: 12),
            // Card(
            //     child: Column(
            //   children: [
            //     ListTile(
            //       title: Text('Rp. 15.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_17px,
            //             fontWeight: FontWeight.w700,
            //             color: Text1,
            //           )),
            //       subtitle: Text('Total : Rp. 16.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_15px,
            //             fontWeight: FontWeight.w500,
            //             color: Text1,
            //           )),
            //     ),
            //   ],
            // )),
            // SizedBox(height: 12),
            // Card(
            //     child: Column(
            //   children: [
            //     ListTile(
            //       title: Text('Rp. 20.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_17px,
            //             fontWeight: FontWeight.w700,
            //             color: Text1,
            //           )),
            //       subtitle: Text('Total : Rp. 21.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_15px,
            //             fontWeight: FontWeight.w500,
            //             color: Text1,
            //           )),
            //     ),
            //   ],
            // )),
            // SizedBox(height: 12),
            // Card(
            //     child: Column(
            //   children: [
            //     ListTile(
            //       title: Text('Rp. 25.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_17px,
            //             fontWeight: FontWeight.w700,
            //             color: Text1,
            //           )),
            //       subtitle: Text('Total : Rp. 26.000',
            //           style: GoogleFonts.nunito(
            //             textStyle: Nunito_15px,
            //             fontWeight: FontWeight.w500,
            //             color: Text1,
            //           )),
            //     ),
            //   ],
            // )),
          ),
          body: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // prefixText: "Rp. ",
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
                          Text('ISI PULSA', style: TextStyle(color: Primary50)),
                  ),
                  Tab(
                    child:
                          Text('PAKET DATA', style: TextStyle(color: Primary50)),
                  ),
                ],
              ),
              Expanded(
                child:      
                       TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
              child: Column(
            children: [
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Informasi Pelanggan',
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w700,
                                      color: Text1,
                                    )),
                                SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('No Ponsel',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w500,
                                          color: Text1,
                                        )),
                                    Text('0895330683880',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w600,
                                          color: Text1,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Voucher Tri',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w500,
                                          color: Text1,
                                        )),
                                    Text('Rp. 5.000',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w600,
                                          color: Text1,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 18),
                                Row(
                                  children: [
                                    Text('Detail Pembayaran',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_17px,
                                          fontWeight: FontWeight.w700,
                                          color: Text1,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Harga Voucher',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w500,
                                          color: Text1,
                                        )),
                                    Text('Rp. 5.000',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w600,
                                          color: Text1,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Biaya Transaksi',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w500,
                                          color: Text1,
                                        )),
                                    Text('Rp. 2.000',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w600,
                                          color: Text1,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Divider(
                                  color: Color(0xff3A3541), // Warna garis
                                  thickness: 1.0, // Ketebalan garis
                                ),
                                SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Pembayaran',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w700,
                                          color: Text1,
                                        )),
                                    Text('Rp. 7.000',
                                        style: GoogleFonts.nunito(
                                          textStyle: Nunito_15px,
                                          fontWeight: FontWeight.w700,
                                          color: Text1,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Button(
                                      "Ubah",
                                      backgroundColor: Primary50,
                                      width: 151,
                                      height: 48,
                                    ),
                                    Button(
                                      onTap: () {
                                        Navigator.push(context, 
                                        MaterialPageRoute(builder: (context) => KonfirPulsa(),)
                                        );
                                      },
                                      "Konfirmasi",
                                      backgroundColor: Secondary50,
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
                title: Text('Rp. 5.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    )),
                subtitle: Text('Total : Rp. 6.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_15px,
                      fontWeight: FontWeight.w500,
                      color: Text1,
                    )),
              ),
            ],
          )),
          SizedBox(height: 12),
          Card(
              child: Column(
            children: [
              ListTile(
                title: Text('Rp. 10.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    )),
                subtitle: Text('Total : Rp. 11.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_15px,
                      fontWeight: FontWeight.w500,
                      color: Text1,
                    )),
              ),
            ],
          )),
          SizedBox(height: 12),
          Card(
              child: Column(
            children: [
              ListTile(
                title: Text('Rp. 15.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    )),
                subtitle: Text('Total : Rp. 16.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_15px,
                      fontWeight: FontWeight.w500,
                      color: Text1,
                    )),
              ),
            ],
          )),
          SizedBox(height: 12),
          Card(
              child: Column(
            children: [
              ListTile(
                title: Text('Rp. 20.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    )),
                subtitle: Text('Total : Rp. 21.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_15px,
                      fontWeight: FontWeight.w500,
                      color: Text1,
                    )),
              ),
            ],
          )),
          SizedBox(height: 12),
          Card(
              child: Column(
            children: [
              ListTile(
                title: Text('Rp. 25.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    )),
                subtitle: Text('Total : Rp. 26.000',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_15px,
                      fontWeight: FontWeight.w500,
                      color: Text1,
                    )),
              ),
            ],
          ))
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
