import 'package:get_it/get_it.dart';
import 'package:visipay/data/repositories/produk.dart';
import '../bloc/produk/produk_bloc.dart';
import '../data/datasources/remote/produk.dart';

void initProdukFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<ProdukBloc>(() => ProdukBloc(
        data: sl<ProdukRepositories>(),
      ));

  /// Repository
  sl.registerLazySingleton<ProdukRepositories>(
      () => ProdukRepositoriesImpl(remoteDatasources: sl<ProdukRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<ProdukRemoteDatasources>(() => ProdukRemoteDatasourcesImpl());
}
