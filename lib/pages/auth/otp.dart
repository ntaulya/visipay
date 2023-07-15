import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:visipay/bloc/login/login_bloc.dart';
import 'package:visipay/bloc/otp/otp_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key, required this.phone});
  final String phone;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
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
              padding: EdgeInsets.only(top: 60),
              child: Text("Masukkan OTP Anda",
                  style: Nunito_21px.apply(color: Colors.white)),
            ),
            // SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: BlocConsumer<OtpBloc, OtpState>(
                listener: (context, state) {
                  if (state is VerifyOtpSuccess) {
                    Navigator.pushNamed(context, "/home");
                  } else if (state is VerifyOtpError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Gagal verifikasi OTP'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SendOtpSuccess) {
                    return PinCodeTextField(
                      onCompleted: (String pin) {
                        context
                            .read<OtpBloc>()
                            .add(VerifyOtp(widget.phone, _pinController.text));
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
                    );
                  } else if (state is OtpLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
