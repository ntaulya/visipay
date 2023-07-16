import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:visipay/extention/currency_extention.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/riwayat/DetailRiwayat.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            title: Text(
              "Riwayat",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: BlocProvider(
            create: (context) => sl<RiwayatBloc>()..add(RiwayatListInisiate()),
            child: BlocBuilder<RiwayatBloc, RiwayatState>(
                builder: (context, state) {
              print(state);
              if (state is RiwayatLoaded) {
                final historydate = state.riwayat
                    .map((e) => DateFormat("dd/MM/yyyy").format(e.createdAt))
                    .toSet()
                    .toList();
                historydate.sort((a, b) => b.compareTo(a));
                final data = historydate
                    .map((e) => {
                          e: state.riwayat.where((element) =>
                              DateFormat("dd/MM/yyyy")
                                  .format(element.createdAt) ==
                              e)
                        })
                    .toList();
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 37,
                            color: Colors.black12,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 7),
                            child: Center(
                                child: Text(
                              '${data[index].keys.first}',
                              style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.bold,
                                  color: Text1),
                            )),
                          ),
                          ...List<Widget>.from(
                            data[index].values.map(
                                  (value) => Column(
                                    children: List<Widget>.from(
                                      value.map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (_) => DetailRiwayat(
                                                id: e.id,
                                              ),
                                            ));
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            color: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${e.notes} - ${e.transaction_status}',
                                                          style: GoogleFonts
                                                              .nunito(
                                                            textStyle:
                                                                Nunito_17px,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          e.amount
                                                              .toRupiahWithSymbol,
                                                          style: GoogleFonts
                                                              .nunito(
                                                            textStyle:
                                                                Nunito_15px,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Pukul ${DateFormat.Hms().format(e.createdAt.toLocal())}',
                                                          style: GoogleFonts
                                                              .nunito(
                                                            textStyle:
                                                                Nunito_15px,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ],
                      );
                    });
              }
              return SizedBox();
            }),
          ),
        )));
  }
}
