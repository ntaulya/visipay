// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:visipay/bloc/promo/promo_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/menu/promo/DaftarPromo.dart';

class DetailPromo extends StatefulWidget {
  final String id;
  const DetailPromo({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPromo> createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: Semantics(
            label: "Kembali",
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Navigator.pushNamed(context, "/daftarpromo");
                Navigator.pop(context);
              },
            ),
          ),
          title: Text("Detail Promo",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                              BlocProvider(
                                  create: (context) =>
                                      sl<PromoBloc>()..add(PromoDetailInisiate(widget.id)),
                                  child: BlocBuilder<PromoBloc, PromoState>(
                                    builder: (context, state) {
                                      print(state);
                                      if (state is PromoLoadedID) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Semantics(
                                                    label: "Icon Promo",
                                                    child: Icon(
                                                      Icons.discount,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  Text(
                                                    state.promo.name,
                                                    style: GoogleFonts.nunito(
                                                      textStyle: Nunito_21px,
                                                      fontWeight: FontWeight.w500,
                                                      color: Text1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              state.promo.description,
                                              style: GoogleFonts.nunito(
                                                textStyle: Nunito_17px,
                                                fontWeight: FontWeight.w300,
                                                color: Text1,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                          ],
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
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
      )),
    );
  }
}
