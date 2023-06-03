import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/riwayat/riwayat.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';

class DetailRiwayat extends StatefulWidget {
  const DetailRiwayat({super.key});

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Riwayat()));
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
          body: SingleChildScrollView(
            child: Container(
            )
            ),
          ),
        ),
      );
  }
}