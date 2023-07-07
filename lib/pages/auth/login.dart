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
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.bold),
                    ),

                    //container
                    SizedBox(height: 8),

                    //text 2
                    Text(
                      'Masuk cuma butuh nomor HP aja.',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),

                    SizedBox(height: 16),

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
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Button("Lanjutkan", onTap: () {
                      context.read<LoginBloc>().add(finduser(_phoneController.text));
                    }),
                  );
                } else if (state is userfound) {
                  Timer(Duration.zero, () {
                    Navigator.of(context)
                        .pushNamed("/pin", arguments: {"phone": _phoneController.text});
                  });
                  return Container();
                } else if (state is LoginError) {
                  print("error");
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Button("Lanjutkan", onTap: () {
                      context.read<LoginBloc>().add(finduser(_phoneController.text));
                    }),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Button(
                    "Lanjutkan",
                    backgroundColor: Primary50.withOpacity(0.5),
                  ),
                );
              },
            ),
          )),
    );
  }
}
