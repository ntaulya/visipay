import 'package:visipay/bloc/editProfile/edit_profile_bloc.dart';
import 'package:visipay/bloc/get_profile/get_profile_bloc.dart';
import 'package:visipay/bloc/login/login_bloc.dart';
import 'package:visipay/data/datasources/remote/auth.dart';
import 'package:visipay/data/datasources/remote/profile.dart';
import 'package:visipay/data/repositories/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:visipay/data/repositories/profile.dart';

import '../bloc/register/register_bloc.dart';

void initProfileFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<GetProfileBloc>(() => GetProfileBloc(
    data: sl<ProfileRepositories>(),));

  sl.registerFactory<EditProfileBloc>(() => EditProfileBloc(
    sl<ProfileRepositories>(),));

  /// Repository
  sl.registerLazySingleton<ProfileRepositories>(()=> ProfileRepositoriesImpl(
    remoteDatasources: sl<ProfileRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<ProfileRemoteDatasources>(()=> ProfileRemoteDatasourcesImpl());
}