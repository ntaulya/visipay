import 'package:get_it/get_it.dart';
import 'package:visipay/bloc/page_navigation/page_navigation_bloc.dart';
import 'package:visipay/injection_container/auth_di.dart';
import 'package:visipay/injection_container/produk_di.dart';
import 'package:visipay/injection_container/profile_di.dart';
import 'package:visipay/injection_container/promo_di.dart';
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
}
