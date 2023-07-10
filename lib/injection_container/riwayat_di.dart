import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:visipay/data/datasources/remote/riwayat.dart';
import 'package:visipay/data/repositories/riwayat.dart';

void initRiwayatFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<RiwayatBloc>(() => RiwayatBloc(
        data: sl<RiwayatRepositories>(),
      ));

  /// Repository
  sl.registerLazySingleton<RiwayatRepositories>(
      () => RiwayatRepositoriesImpl(remoteDatasources: sl<RiwayatRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<RiwayatRemoteDatasources>(() => RiwayatRemoteDatasourcesImpl());
}
