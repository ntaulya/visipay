import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/cekTransaksi/cek_transaksi_bloc.dart';
import 'package:visipay/bloc/topupEwallet/topup_e_wallet_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/data/model/charge_response.dart';
import 'package:visipay/data/model/topup_payload.dart';
import 'package:visipay/data/model/topup_payload_model.dart';
import 'package:visipay/data/model/transaction_method.dart';
import 'package:visipay/data/repositories/transaction.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/promo_terpilih.dart';
import 'package:visipay/pages/menu/topup/topup.dart';
import 'package:visipay/widgets/button.dart';

class VirtualAccount extends StatefulWidget {
  final ChargeResponse data;
  final Transaction_Method bank;

  const VirtualAccount({
    super.key,
    required this.data,
    required this.bank,
  });

  @override
  State<VirtualAccount> createState() => _VirtualAccountState();
}

class _VirtualAccountState extends State<VirtualAccount> {
  void _copyTextToClipboard(BuildContext context, String noVA) {
    Clipboard.setData(ClipboardData(text: noVA));

    final snackBar = SnackBar(
      content: Text('nomor VA berhasil disalin'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  late Timer _timer;
  DateTime? expiredAt;
  String timesLeft = "-";
  String twoDigits(int n) => n.toString().padLeft(2, "0");

  @override
  initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTimer();
    });
    _updateTimer();
  }

  _updateTimer() {
    final expiryTime = widget.data.midtrans.expiryTime;
    int timeDiff = expiryTime.difference(DateTime.now()).inSeconds;
    if (expiryTime != DateTime.now()) {
      timeDiff -= 1;
    }

    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    if (timesLeft == "00:00:00") {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Waktu habis')),
      );
      setState(() {
        timesLeft = "-";
      });
      _timer.cancel();
    }

    setState(() {
      timesLeft =
          "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
    });

    log(timesLeft);
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    sl<TransactionRepositories>()
                        .cancelTransaction(widget.data.midtrans.transactionId);
                    Navigator.pop(context, true);
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
              Image.asset(
                  "assets/img/${widget.data.midtrans.vaNumbers.first.bank.toUpperCase()}.png",
                  width: 96,
                  height: 48),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data.midtrans.vaNumbers.first.bank.toUpperCase(),
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_17px,
                        fontWeight: FontWeight.w700,
                        color: Text1,
                      )),
                  Text("Waktu tersisa $timesLeft",
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
          Container(
            width: 328,
            color: Color(0xffF1F6F9),
            padding: EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("No Virtual Account",
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_15px,
                    fontWeight: FontWeight.w500,
                    color: Text1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.data.midtrans.vaNumbers.first.vaNumber,
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_21px,
                        fontWeight: FontWeight.w700,
                        color: Secondary50,
                      )),
                  Semantics(
                    label: "Salin nomor",
                    hint: "tekan untuk menyalin nomor Virtual Akun",
                    child: GestureDetector(
                      excludeFromSemantics: true,
                      onTap: () {
                        _copyTextToClipboard(context,
                            widget.data.midtrans.vaNumbers.first.vaNumber);
                        HapticFeedback.heavyImpact();
                        // AccessibilityEventAnnouncement('Tombol berhasil di klik');
                        // announce('Tombol berhasil di klik');
                      },
                      child: Icon(Icons.copy),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(height: 17),
          Text(
            "Tata Cara Top Up di " + widget.bank.method_name,
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
                  child: Text(widget.bank.instruction),
                ),
              ],
            ),
          ),
          SizedBox(height: 144),
        ]),
        bottomNavigationBar: BlocBuilder<TopupEWalletBloc, TopupEWalletState>(
          builder: (topupContext, topupState) {
            return BlocListener<CekTransaksiBloc, CekTransaksiState>(
              listener: (context, state) {
                print(state);
                if (state is CekTransaksiLoaded) {
                  if (widget.data.userTransaction.transactionStatus == "done") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  }
                  if (widget.data.userTransaction.transactionStatus ==
                      "pending") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Selesaikan pembayaran anda")));
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
                          context
                              .read<CekTransaksiBloc>()
                              .add(CekTransaksiInisiate(
                                widget.data.midtrans.transactionId,
                              ));
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
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => sl<TopupEWalletBloc>()
  //       ..add(
  //         TopupEWalletInisiate(
  //           TopupPayloadModel(
  //             bankTransfer: BankTransfer(bank: widget.data.method_name),
  //             notes: 'TopupEWallet',
  //             paymentType: 'bank_transfer',
  //             transactionDetails:
  //                 TransactionDetailsModel(grossAmount: widget.grossAmount),
  //           ),
  //         ),
  //       ),
  //     child: BlocBuilder<TopupEWalletBloc, TopupEWalletState>(
  //       builder: (context, state) {
  //         return;
  //       },
  //     ),
  //   );
  // }
}
