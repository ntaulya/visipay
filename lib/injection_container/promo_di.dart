import 'package:visipay/bloc/promo/promo_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:visipay/data/datasources/remote/promo.dart';
import 'package:visipay/data/repositories/promo.dart';

void initPromoFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<PromoBloc>(() => PromoBloc(
        data: sl<PromoRepositories>(),
      ));

  /// Repository
  sl.registerLazySingleton<PromoRepositories>(
      () => PromoRepositoriesImpl(remoteDatasources: sl<PromoRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<PromoRemoteDatasources>(() => PromoRemoteDatasourcesImpl());
}
