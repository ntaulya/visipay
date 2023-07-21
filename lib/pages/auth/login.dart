import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/login/login_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/auth/pin.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/widgets/button.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              //vector up
              // Transform.translate(
              //   offset: Offset(MediaQuery.of(context).size.width * 0.2, -80),
              //   child: SvgPicture.asset(
              //     'images/vector.svg',
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40),
                    //gambar
                    // Center(child: Image.asset('images/login.png', height: MediaQuery.of(context).size.height * 0.4)),

                    //container
                    SizedBox(height: 16),

                    //text 1
                    Text(
                      'Masuk',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                    ),

                    //container
                    SizedBox(height: 8),

                    //text 2
                    Text(
                      'Masuk cuma butuh nomor HP aja.',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),

                    SizedBox(height: 32),

                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '+62 8xx - xxxx - xxxx',
                      ),
                      controller: _phoneController,
                    ),

                    SizedBox(height: 2),

                    // Row(
                    //   children: [
                    //     Text(
                    //       'Nomor HP nggak aktif atau hilang?',
                    //       style: GoogleFonts.nunito(
                    //           textStyle: Nunito_17px,
                    //           fontWeight: FontWeight.normal),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.of(context).pushNamed('/home');
                    //         print("tes");
                    //         Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Home(),)
                    //         );
                    //       },
                    //       child: Text(
                    //         'Atur Ulang',
                    //         style: GoogleFonts.nunito(
                    //             textStyle: Nunito_17px,
                    //             fontWeight: FontWeight.normal),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
          //bottom bar
          bottomNavigationBar: BlocProvider(
            create: (context) => sl<LoginBloc>(),
            child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
              if (state is userfound) {
                Navigator.of(context)
                    .pushNamed("/pin", arguments: {"phone": _phoneController.text});
              } else if (state is userNotFound) {
                showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          'Nomor tidak ditemukan, apakah anda ingin mendaftar terlebih dahulu?'),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                          child: const Text('Ke Halaman Register'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              }
            }, builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: Button(
                  "Lanjutkan",
                  height: 60,
                  backgroundColor: (state is LoginInitial || state is LoginError)
                      ? Primary50
                      : Primary50.withOpacity(0.5),
                  onTap: () {
                    if (_phoneController.text.startsWith('0')) {
                      _phoneController.text = '62' + _phoneController.text.substring(1);
                    }
                    context.read<LoginBloc>().add(finduser(_phoneController.text));
                  },
                ),
              );
            }),
          )),
    );
  }
}
