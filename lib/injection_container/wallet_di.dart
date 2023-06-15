import 'package:visipay/data/datasources/remote/wallet.dart';
import 'package:get_it/get_it.dart';
import 'package:visipay/data/repositories/wallet.dart';

import '../bloc/get_wallet/get_wallet_bloc.dart';

void initWalletFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<GetWalletBloc>(() => GetWalletBloc(
    sl<WalletRepositories>(),));

  /// Repository
  sl.registerLazySingleton<WalletRepositories>(()=> WalletRepositoriesImpl(
    remoteDatasources: sl<WalletRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<WalletRemoteDatasources>(()=> WalletRemoteDatasourcesImpl());
}