import 'package:get_it/get_it.dart';
import 'package:visipay/bloc/cekTransaksi/cek_transaksi_bloc.dart';
import 'package:visipay/bloc/topupEwallet/topup_e_wallet_bloc.dart';
import 'package:visipay/bloc/transaction_method/transaction_method_bloc.dart';
import 'package:visipay/data/datasources/remote/transaction.dart';
import 'package:visipay/data/repositories/produk.dart';
import 'package:visipay/data/repositories/transaction.dart';
import '../bloc/produk/produk_bloc.dart';
import '../data/datasources/remote/produk.dart';

void initTransactionFeatures(GetIt sl) {
  /// Bloc
  sl.registerFactory<TransactionMethodBloc>(() => TransactionMethodBloc(
        data: sl<TransactionRepositories>(),
      ));

  sl.registerFactory<TopupEWalletBloc>(() => TopupEWalletBloc(
        sl<TransactionRepositories>(),
      ));

  sl.registerFactory<CekTransaksiBloc>(() => CekTransaksiBloc(
        sl<TransactionRepositories>(),
      ));

  /// Repository
  sl.registerLazySingleton<TransactionRepositories>(() =>
      TransactionRepositoriesImpl(
          remoteDatasources: sl<TransactionRemoteDatasources>()));

  /// Datasources
  sl.registerLazySingleton<TransactionRemoteDatasources>(
      () => TransactionRemoteDatasourcesImpl());
}
