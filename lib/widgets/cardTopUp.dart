import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/pages/data/dataTopup.dart';
import 'package:visipay/pages/menu/topup/topup.dart';

class CardTopUp extends StatefulWidget {
  final int nominal;
  const CardTopUp({required this.nominal});

  @override
  State<CardTopUp> createState() => _CardTopUpState();
}

class _CardTopUpState extends State<CardTopUp> {
  // late int savedData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          shadowColor: Colors.black,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
              onTap: () {
                DataUtil.saveData(widget.nominal);
                // setState(() {
                //   savedData = (widget.nominal).toString();
                // });
              },
              child: Center(
                  child: Text("Rp " + (widget.nominal).toString(),
                      style: GoogleFonts.nunito(
                          textStyle: Nunito_17px,
                          fontWeight: FontWeight.w700,
                          color: Text1))))),
    );
  }
}
