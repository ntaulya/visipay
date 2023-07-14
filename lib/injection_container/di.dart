import 'package:get_it/get_it.dart';
import 'package:visipay/injection_container/auth_di.dart';
import 'package:visipay/injection_container/pembayaran_di.dart';
import 'package:visipay/injection_container/produk_di.dart';
import 'package:visipay/injection_container/profile_di.dart';
import 'package:visipay/injection_container/promo_di.dart';
import 'package:visipay/injection_container/riwayat_di.dart';
import 'package:visipay/injection_container/transaction_di.dart';
import 'package:visipay/injection_container/wallet_di.dart';

final GetIt sl = GetIt.instance;
Future<void> init() async {
  initFeatures();
}

void initFeatures() {
  initAuthFeatures(sl);
  initProfileFeatures(sl);
  initWalletFeatures(sl);
  initPromoFeatures(sl);
  initProdukFeatures(sl);
  initRiwayatFeatures(sl);
  initPembayaranFeatures(sl);
  initTransactionFeatures(sl);
}
