
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:visipay/data/model/riwayat.dart';
import 'package:visipay/injection_container/di.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';

class DetailRiwayat extends StatefulWidget {
  final String id;
  const DetailRiwayat({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailRiwayat> createState() => _DetailRiwayatState();
}

class _DetailRiwayatState extends State<DetailRiwayat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Primary50,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
              },
              ),
              title: Text(
                "Detail Riwayat Transaksi",
                style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                  BlocProvider(
                                      create: (context) => sl<RiwayatBloc>()
                                        ..add(RiwayatDetailInisiate(widget.id)),
                                      child: BlocBuilder<RiwayatBloc,
                                              RiwayatState>(
                                          
                                          builder: (context, state) {
                                          print(state);
                                          if (state is RiwayatLoadedID) {
                                            return Column(
                                              children: [
                                                Image.asset(
                                                  "assets/icon/PLN Listrik.png",
                                                  width: 34,
                                                  height: 34,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      state.riwayat.notes!,
                                                      style: GoogleFonts.nunito(
                                                        textStyle: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          } else {
                                            return Container();
                                          }
                                          }
                                      ))
                                ])),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
