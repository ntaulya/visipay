// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/topupEwallet/topup_e_wallet_bloc.dart';
import 'package:visipay/bloc/transaction_method/transaction_method_bloc.dart';
import 'package:visipay/data/model/topup_payload.dart';
import 'package:visipay/data/model/topup_payload_model.dart';
import 'package:visipay/data/model/transaction_method.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/topup/VA.dart';
import 'package:visipay/widgets/card.dart';
import 'package:visipay/widgets/cardTopUp.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  late BuildContext blocContext;
  String inputNominal = "";
  final TextEditingController nominalController = TextEditingController();
  late Transaction_Method transaction_method;

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
          ),
          title: Text(
            "Top Up",
            style: GoogleFonts.nunito(
                textStyle: Nunito_21px, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Container(
                // color: Colors.green,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Text(
                  "Jumlah Top Up",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 280,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        CardTopUp(
                          nominal: 20000,
                          controller: nominalController,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(
                          nominal: 50000,
                          controller: nominalController,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(
                          nominal: 100000,
                          controller: nominalController,
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        CardTopUp(
                          nominal: 200000,
                          controller: nominalController,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(
                          nominal: 300000,
                          controller: nominalController,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(
                          nominal: 500000,
                          controller: nominalController,
                        )
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: nominalController,
                  decoration: InputDecoration(
                    prefixText: "Rp. ",
                    // labelText: 'Username',
                    hintText: 'Masukkan Nominal',
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
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Text(
                  "Pilih Bank",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              BlocProvider(
                create: (context) =>
                    sl<TransactionMethodBloc>()..add(TransactionMethodListInisiate()),
                child: BlocBuilder<TransactionMethodBloc, TransactionMethodState>(
                  builder: (context, state) {
                    if (state is TransactionMethodLoading) {
                      return CircularProgressIndicator();
                    } else if (state is TransactionMethodLoaded) {
                      return BlocListener<TopupEWalletBloc, TopupEWalletState>(
                        listener: (topupcontext, topupstate) {
                          if (topupstate is TopupEWalletLoaded) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VirtualAccount(data: topupstate.data, bank: transaction_method),
                              ),
                            );
                          } else if (topupstate is TopupEWalletLoading) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Memuat transaksi"),
                              ),
                            );
                          } else if (topupstate is TopupEWalletError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Gagal memuat transaksi"),
                              ),
                            );
                          }
                        },
                        child: Wrap(
                            children: List<Widget>.from(
                          state.items.map(
                            (e) => CardButton(
                              onTap: () {
                                if (nominalController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Anda belum menginputkan nominal")));
                                  return;
                                }
                                transaction_method = e;
                                context.read<TopupEWalletBloc>().add(TopupEWalletInisiate(
                                    TopupPayloadModel(
                                        bankTransfer: BankTransfer(bank: e.method_name),
                                        notes: "Top Up E-Wallet",
                                        paymentType: "bank_transfer",
                                        transactionDetails: TransactionDetails(
                                            grossAmount: int.parse(nominalController.text)))));
                              },
                              text: e.method_name,
                              image: "assets/img/${e.method_name}.png",
                            ),
                          ),
                        )),
                      );
                    } else if (state is TransactionMethodError) {
                      return Text(state.error_message);
                    }
                    return SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
