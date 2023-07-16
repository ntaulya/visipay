import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/cekTransaksi/cek_transaksi_bloc.dart';
import 'package:visipay/bloc/topupEwallet/topup_e_wallet_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/data/model/topup_payload.dart';
import 'package:visipay/data/model/topup_payload_model.dart';
import 'package:visipay/data/model/transaction_method.dart';
import 'package:visipay/data/repositories/transaction.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/promo_terpilih.dart';
import 'package:visipay/pages/menu/topup/topup.dart';
import 'package:visipay/widgets/button.dart';

class VirtualAccount extends StatelessWidget {
  final Transaction_Method data;
  final int grossAmount;

  const VirtualAccount(
      {super.key, required this.data, required this.grossAmount});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TopupEWalletBloc>()
        ..add(
          TopupEWalletInisiate(
            TopupPayloadModel(
              bankTransfer: BankTransfer(bank: data.method_name),
              notes: 'TopupEWallet',
              paymentType: 'bank_transfer',
              transactionDetails:
                  TransactionDetailsModel(grossAmount: grossAmount),
            ),
          ),
        ),
      child: BlocBuilder<TopupEWalletBloc, TopupEWalletState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              final shouldPop = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                        'Jika anda kembali, maka anda akan membatalkan transaksi'),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (state is TopupEWalletLoaded) {
                            sl<TransactionRepositories>().cancelTransaction(
                                state.data.midtrans.transactionId);
                            Navigator.pop(context, true);
                          }
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  );
                },
              );
              return shouldPop!;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Primary50,
                leading: Semantics(
                  label: "Kembali",
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  ),
                ),
                title: Text("Top Up",
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
              ),
              body: Column(children: [
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(children: [
                    Image.asset("assets/img/${data.method_name}.png",
                        width: 96, height: 48),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.method_name,
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w700,
                              color: Text1,
                            )),
                        Text("Waktu tersisa 09.59.00",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.w700,
                              color: Text1,
                            )),
                      ],
                    )
                  ]),
                ),
                SizedBox(height: 20),
                if (state is TopupEWalletLoading) ...{
                  CircularProgressIndicator(),
                } else if (state is TopupEWalletLoaded) ...{
                  Container(
                    width: 328,
                    height: 92,
                    color: Color(0xffF1F6F9),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No Virtual Account",
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              )),
                          Text(state.data.midtrans.vaNumbers.first.vaNumber,
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_21px,
                                fontWeight: FontWeight.w700,
                                color: Secondary50,
                              )),
                        ]),
                  ),
                } else if (state is TopupEWalletError) ...{
                  Text(state.error_message),
                },
                SizedBox(height: 17),
                Text(
                  "Tata Cara Top Up di " + data.method_name,
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_15px,
                    fontWeight: FontWeight.w700,
                    color: Text1,
                  ),
                ),
                SizedBox(height: 17),
                Container(
                  padding: EdgeInsets.all(16.0),
                  width: 328,
                  height: 230,
                  color: Color(0xffF9F5FF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(data.instruction),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 144),
              ]),
              bottomNavigationBar:
                  BlocBuilder<TopupEWalletBloc, TopupEWalletState>(
                builder: (topupContext, topupState) {
                  return BlocListener<CekTransaksiBloc, CekTransaksiState>(
                    listener: (context, state) {
                      print(state);
                      if (state is CekTransaksiLoaded) {
                        if (state.data.userTransaction.transactionStatus ==
                            "done") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        }
                        if (state.data.userTransaction.transactionStatus ==
                            "pending") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Selesaikan pembayaran anda")));
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Button(
                            onTap: () {
                              print(topupState);
                              if (topupState is TopupEWalletLoaded) {
                                context.read<CekTransaksiBloc>().add(
                                    CekTransaksiInisiate(topupState
                                        .data.midtrans.transactionId));
                              }
                            },
                            "Cek Transaksi",
                            backgroundColor: Primary50,
                            width: 328,
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
