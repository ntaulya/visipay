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
      inputNumber = value.replaceFirst("0", "62");
    });
    blocContext.read<ProdukBloc>().add(GetProdukListInisiate(
        code: "", category: "Pulsa", phone_number: inputNumber));
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
                    onTap: (value) {
                      if (value == 0) {
                        blocContext.read<ProdukBloc>().add(
                            GetProdukListInisiate(
                                code: "",
                                category: "Pulsa",
                                phone_number: inputNumber));
                      } else if (value == 1) {
                        blocContext.read<ProdukBloc>().add(
                            GetProdukListInisiate(
                                code: "",
                                category: "Paket-Data",
                                phone_number: inputNumber));
                      }
                    },
                  ),
                  Expanded(
                    child: BlocProvider(
                        create: (context) =>
                            sl<ProdukBloc>()..add(initProduk()),
                        child: BlocBuilder<ProdukBloc, ProdukState>(
                            builder: (context, state) {
                          blocContext = context;
                          if (state is ProdukListLoaded) {
                            return ListView.builder(
                                itemCount: state.produk.length,
                                itemBuilder: (context, index) {
                                  return CardPulsa(
                                    notes: '',
                                    no_hp: inputNumber,
                                    title: state.produk[index].name,
                                    produk: state.produk[index],
                                  );
                                });
                          } else {
                            return Container();
                          }
                        })),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
