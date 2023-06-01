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
  final TextEditingController _pinController = TextEditingController();

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
                      'Masuk atau Daftar',
                      style: GoogleFonts.nunito(
                          textStyle: Nunito_17px, fontWeight: FontWeight.bold),
                    ),
    
                    //container
                    SizedBox(height: 8),
    
                    //text 2
                    Text(
                      'Masuk atau Daftar cuma butuh nomor HP aja.',
                      style: GoogleFonts.nunito(
                          textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),
    
                    SizedBox(height: 16),
    
                    TextField(
                      onSubmitted: (value) {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => pin(),)
                        );
                      },
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
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Button("Lanjutkan", onTap: () {
                      context.read<LoginBloc>().add(RegisterFormSubmit(_phoneController.text, _pinController.text));
                    }),
                  );
                }
                // return Padding(
                //   padding: const EdgeInsets.all(40.0),
                //   child: TextButton(
                //     child: Text("Lanjutkan"),
                //     onPressed: () {
                //       // Navigator.of(context).pushNamed('/home');
                //       Navigator.push(context, 
                //       MaterialPageRoute(builder: (context) => Home(),)
                //       );
                //     },
                //   ),
                // );
                return Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16, bottom: 40),
                  child: Container(
                        // width: 380,
                        height: 48,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            backgroundColor: Primary50,
                          ),
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => pin(),)
                            );
                          },
                          child: Text(
                            "Lanjutkan",
                            style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                );
              },
            ),
          )),
    );
  }
}
