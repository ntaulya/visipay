import 'package:visipay/bloc/login/login_bloc.dart';
import 'package:visipay/bloc/otp/otp_bloc.dart';
import 'package:visipay/bloc/page_navigation/page_navigation_bloc.dart';
import 'package:visipay/data/datasources/remote/auth.dart';
import 'package:visipay/data/repositories/auth.dart';
import 'package:get_it/get_it.dart';

import '../bloc/register/register_bloc.dart';

void initAuthFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<PageNavigationBloc>(() => PageNavigationBloc());
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(
        data: sl<AuthRepositories>(),
      ));
  sl.registerFactory<LoginBloc>(() => LoginBloc(
        data: sl<AuthRepositories>(),
      ));
  sl.registerFactory<OtpBloc>(() => OtpBloc(
        sl<AuthRepositories>(),
      ));

  /// Repository
  sl.registerLazySingleton<AuthRepositories>(() =>
      AuthRepositoriesImpl(remoteDatasources: sl<AuthRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<AuthRemoteDatasources>(
      () => AuthRemoteDatasourcesImpl());
}
