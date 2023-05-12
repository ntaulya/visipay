import 'package:get_it/get_it.dart';
import 'package:visipay/injection_container/auth_di.dart';

final GetIt sl = GetIt.instance;
Future<void> init() async {
  initFeatures();

}
void initFeatures() {
  initAuthFeatures(sl);
}