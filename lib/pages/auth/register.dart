import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/otp/otp_bloc.dart';
import 'package:visipay/bloc/register/register_bloc.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/auth/otp.dart';
import 'package:visipay/widgets/button.dart';

class Register extends StatefulWidget {
  const Register({super.key}); //untuk parsing data ke register, widget

  @override
  State<Register> createState() => _RegisterState(); //nyoba datanya dengan state
}

class _RegisterState extends State<Register> {
  //data tiap field
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _pinConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),

                    //text 1
                    Text(
                      'Daftar Akun',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                    ),

                    //text 2
                    Text(
                      'Lengkapi profile untuk melanjutkan',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),

                    SizedBox(height: 8),

                    //nama lengkap
                    Text(
                      'Nama Lengkap',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan Nama Lengkap',
                      ),
                      controller: _nameController,
                    ),

                    SizedBox(height: 8),

                    //no handphone
                    Text(
                      'No Handphone',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan No Handphone',
                      ),
                      controller: _phoneController,
                    ),

                    SizedBox(height: 8),

                    //email
                    Text(
                      'E-Mail',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),

                    SizedBox(height: 8),

                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan E-Mail',
                      ),
                      controller: _emailController,
                    ),

                    SizedBox(height: 8),

                    //pin transaksi
                    Text(
                      'Masukkan PIN',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan PIN Transaksi',
                      ),
                      controller: _pinController,
                    ),

                    SizedBox(height: 8),

                    //konfirmasi pin
                    Text(
                      'Konfirmasi PIN',
                      style:
                          GoogleFonts.nunito(textStyle: Nunito_17px, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Konfirmasi PIN Anda',
                      ),
                      controller: _pinConfirmController,
                    ),
                  ],
                ),
              ),
            ),

            // bottom bar dengan API
            bottomNavigationBar: BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterInitial) {
                    //registerinitial buat kalau event nya gak di trigger
                  } else if (state is RegisterSuccess) {
                    //jika sukses
                    context.read<OtpBloc>().add(SendOtp(_phoneController.text));
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return VerifyOtpPage(phone: _phoneController.text);
                      },
                    ));
                    //kalau register gagal
                  } else if (state is RegisterError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Anda Gagal Registrasi'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  } else if (state is userfound) {
                    showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Nomor sudah terdaftar, silahkan login'),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: const Text('Ke Halaman Login'),
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
                  } else if (state is userNotFound) {
                    context.read<RegisterBloc>().add(RegisterFormSubmit(_phoneController.text,
                        _nameController.text, _emailController.text, _pinController.text));
                  }
                },
                //buat nampilin widget
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Button(
                    "Lanjutkan",
                    height: 60,
                    onTap: () {
                      context.read<RegisterBloc>().add(finduser(_phoneController.text));
                    },
                  ),
                )))
        // bottomNavigationBar: Container(
        //   padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        //   // width: 380,
        //   height: 78,
        //   child: TextButton(
        //     style: TextButton.styleFrom(
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(100)),
        //       backgroundColor: Primary50,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => Home(),
        //           ));
        //     },
        //     child: Text(
        //       "Lanjutkan",
        //       style: GoogleFonts.nunito(
        //           textStyle: Nunito_15px,
        //           fontWeight: FontWeight.w500,
        //           color: Colors.white),
        //     ),
        //   ),
        // )),
        );
  }
}
