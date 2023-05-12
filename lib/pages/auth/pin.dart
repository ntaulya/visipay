import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/SvgIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/SvgIcon.dart';
import 'package:visipay/widgets/button.dart';

class pin extends StatefulWidget {
  @override
  State<pin> createState() => _pinState();
}

class _pinState extends State<pin> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Primary50,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:60),
              child: Text("Masukkan Security Code",
                  style: Nunito_21px.apply(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: PinCodeTextField(
                onCompleted: (String pin) {
                  print(pin);
                },
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    inactiveColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    borderWidth: 0,
                    selectedFillColor: Colors.white,
                    activeColor: Colors.white,
                    errorBorderColor: Colors.white),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: _pinController,
                onChanged: (String pin) {},
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
      ),
    );
  }
}
