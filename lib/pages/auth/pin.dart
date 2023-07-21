import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:visipay/bloc/login/login_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/data/repositories/wallet.dart';

class Pin extends StatefulWidget {
  final String? phone;

  const Pin({super.key, this.phone});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
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
              child: Text("Masukkan Security Code", style: Nunito_21px.apply(color: Colors.white)),
            ),
            // SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) async {
                    if (state is LoginSuccess) {
                      await sl<WalletRepositories>().createWallet();

                      await Future.delayed(const Duration(seconds: 0)).whenComplete(
                        () => Navigator.of(context).pushNamedAndRemoveUntil("/home", (_) => false),
                      );
                    }
                  },
                  child: PinCodeTextField(
                    onCompleted: (String pin) {
                      if (widget.phone == null) {
                        context.read<LoginBloc>().add(
                              userPIN(pin),
                            );
                      } else {
                        context.read<LoginBloc>().add(
                              LoginFormSubmit(widget.phone ?? '', pin),
                            );
                      }
                    },
                    appContext: context,
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: "*",
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
