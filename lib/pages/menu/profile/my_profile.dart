import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/get_profile/get_profile_bloc.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/profile/edit_profile.dart';

import '../../../widgets/button.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  late BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Primary50,
              leading: Semantics(
                label: "Kembali",
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                  },
                ),
              ),
              title: Text(
                "Profile",
                style: GoogleFonts.nunito(
                    textStyle: Nunito_21px, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            body: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: BlocProvider(
                create: (context) => sl<GetProfileBloc>()..add(GetProfileInisiate()),
                child: BlocBuilder<GetProfileBloc, GetProfileState>(
                  builder: (context, state) {
                    blocContext = context;
                    if (state is GetProfileLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Nama',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_21px,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            state.user.name,
                            textAlign: TextAlign.start,
                            style: Nunito_21px.apply(fontWeightDelta: 1),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Nomor Handphone',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_21px,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            state.user.phone,
                            textAlign: TextAlign.start,
                            style: Nunito_21px.apply(fontWeightDelta: 1),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'E-Mail',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_21px,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            state.user.email,
                            textAlign: TextAlign.start,
                            style: Nunito_21px.apply(fontWeightDelta: 1),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Kebijakan Privasi',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunito(
                              decoration: TextDecoration.underline,
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Terms & Condition',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunito(
                              decoration: TextDecoration.underline,
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    } else if (state is GetProfileError) {
                      return Container(
                        child: Text(state.error_message),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      "Edit Profile",
                      backgroundColor: Primary50,
                      width: 286,
                      height: 45,
                      onTap: () async {
                        final isSuccess = await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const EditProfile()));
                        if (isSuccess != null && isSuccess == true) {
                          blocContext.read<GetProfileBloc>().add(GetProfileInisiate());
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    Button(
                      "Log Out",
                      onTap: () async {
                        await saveJWT("");
                        Navigator.of(context).pushReplacementNamed('/onboarding');
                      },
                      backgroundColor: Color(0xffD66161),
                      width: 286,
                      height: 45,
                    ),
                  ]),
            )));
  }
}
