import 'package:get_it/get_it.dart';
import 'package:visipay/bloc/pembayaran/pembayaran_bloc.dart';
import 'package:visipay/data/datasources/remote/pembayaran.dart';
import 'package:visipay/data/repositories/pembayaran.dart';

void initPembayaranFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<PembayaranBloc>(() => PembayaranBloc(
        data: sl<PembayaranRepositories>(),
      ));

  /// Repository
  sl.registerLazySingleton<PembayaranRepositories>(
      () => PembayaranRepositoriesImpl(remoteDatasources: sl<PembayaranRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<PembayaranRemoteDatasources>(() => PembayaranRemoteDatasourcesImpl());
}
