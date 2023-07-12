// ignore_for_file: unused_field, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/produk/produk_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';
import 'package:visipay/widgets/cardPulsa.dart';

class PulsaPaket extends StatefulWidget {
  // String? inputNumber;
  PulsaPaket({super.key});

  @override
  State<PulsaPaket> createState() => _PulsaPaketState();
}

class _PulsaPaketState extends State<PulsaPaket> {
  late BuildContext blocContext;
  String inputNumber = "";

  void onFieldSubmitted(String value) {
    setState(() {
      inputNumber = value;
    });
    blocContext.read<ProdukBloc>().add(
        GetProdukListInisiate(code: "", category: "Pulsa/Paket Data", idPelanggan: value));
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
                  BlocProvider(
                      create: (context) => sl<ProdukBloc>()..add(initProduk()),
                      child: BlocBuilder<ProdukBloc, ProdukState>(
                          builder: (context, state) {
                        blocContext = context;
                        if (state is ProdukListLoaded) {
                          return ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                    color: Colors.black,
                                  ),
                              itemCount: state.produk.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Container(
                                width: 328,
                                height: 92,
                                color: Color(0xffF1F6F9),
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(state.produk[0].price.toString(),
                                          style: GoogleFonts.nunito(
                                            textStyle: Nunito_15px,
                                            fontWeight: FontWeight.w500,
                                            color: Text1,
                                          )),
                                      Text(
                                          (state.produk[0].price + 2500)
                                              .toString(),
                                          style: GoogleFonts.nunito(
                                            textStyle: Nunito_21px,
                                            fontWeight: FontWeight.w700,
                                            color: Secondary50,
                                          )),
                                    ]),
                                  )
                                ]);
                              });
                        } else {
                          return Container();
                        }
                      } 
                      ))

                  //           : Center(child: Text("Input Nomor Telfon"))
                  //       // if (widget.inputNumber != null)){
                  //       //   SingleChildScrollView(
                  //       //   child: Container(
                  //       //     padding: EdgeInsets.symmetric(horizontal: 16),
                  //       //     child: Column(
                  //       //       children: [
                  //       //         CardPulsa(harga: 5000),
                  //       //         CardPulsa(harga: 10000),
                  //       //         CardPulsa(harga: 25000),
                  //       //         CardPulsa(harga: 50000),
                  //       //         CardPulsa(harga: 75000),
                  //       //         CardPulsa(harga: 100000),
                  //       //         CardPulsa(harga: 150000),
                  //       //       ],
                  //       //     ),
                  //       //   ),
                  //       // )
                  //       // }
                  //       ,
                  //       Center(
                  //         child: Text("Paket Data Tidak Tersedia"),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ));
  }
}
