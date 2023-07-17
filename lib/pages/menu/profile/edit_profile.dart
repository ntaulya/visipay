import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/editProfile/edit_profile_bloc.dart';
import 'package:visipay/bloc/get_profile/get_profile_bloc.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/profile/my_profile.dart';

import '../../../widgets/button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                ),
              ),
              title: Text(
                "Edit Profile",
                style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            body: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: BlocProvider(
                create: (context) =>
                    sl<GetProfileBloc>()..add(GetProfileInisiate()),
                child: BlocBuilder<GetProfileBloc, GetProfileState>(
                  builder: (context, state) {
                    blocContext = context;
                    if (state is GetProfileLoaded) {
                      _nameController.text = state.user.name;
                      _phoneController.text = state.user.phone;
                      _emailController.text = state.user.email;
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
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan Nama',
                            ),
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
                          TextField(
                            controller: _phoneController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan No Handphone',
                            ),
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
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukkan E-Mail',
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
                    BlocListener<EditProfileBloc, EditProfileState>(
                      listener: (context, state) {
                        if (state is EditProfileSuccess) {
                         
                          Navigator.pop(context, true);
                        } else if (state is EditProfileError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Gagal mengedit profile")));
                        }
                      },
                      child: Button("Save",
                          backgroundColor: Secondary50,
                          width: 286,
                          height: 45, onTap: () {
                        context.read<EditProfileBloc>().add(EditProfileInisiate(
                            _nameController.text, _emailController.text));
                      }),
                    ),
                    SizedBox(height: 8),
                    Button(
                      "Log Out",
                      onTap: () async {
                        await saveJWT("");
                        Navigator.of(context).pushNamed('onboarding');
                      },
                      backgroundColor: Color(0xffD66161),
                      width: 286,
                      height: 45,
                    ),
                  ]),
            )));
  }
}
