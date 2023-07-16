import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:visipay/bloc/cekTransaksi/cek_transaksi_bloc.dart';
import 'package:visipay/bloc/editProfile/edit_profile_bloc.dart';
import 'package:visipay/bloc/otp/otp_bloc.dart';
import 'package:visipay/bloc/produk/produk_bloc.dart';
import 'package:visipay/bloc/register/register_bloc.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/router.dart';
import 'injection_container/di.dart' as di;
import 'package:visipay/bloc/login/login_bloc.dart';

void main() async {
  await di.init();
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final IRouter _router = VisiPayRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProdukBloc>()),
        BlocProvider(create: (context) => sl<CekTransaksiBloc>()),
        BlocProvider(create: (context) => sl<EditProfileBloc>()),
        BlocProvider(create: (context) => sl<RegisterBloc>()),
        BlocProvider(create: (context) => sl<OtpBloc>()),
        BlocProvider(create: (context) => sl<LoginBloc>()),
        
      ],
      child: MaterialApp(
        // home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: _router.initialRoute,
        onGenerateRoute: _router.onGenerateRoute,
        onUnknownRoute: _router.onUnknownRoute,
      ),
      );
  }
}
