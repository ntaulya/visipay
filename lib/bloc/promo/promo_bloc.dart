import 'package:bloc/bloc.dart';
import 'package:visipay/data/model/promo.dart';
import 'package:visipay/data/repositories/profile.dart';
import 'package:visipay/data/repositories/promo.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final PromoRepositories data;

  PromoBloc ({required this.data}) : super(PromoLoading()) { //nampilin data pertama kali
    on<PromoEvent>((event, emit) async {
      if (event is PromoInisiate) {
        emit(PromoLoading());
        final failureOrUser = await data.getPromoList();
        
        emit(failureOrUser.fold((err_message) => PromoError(err_message), (Promo) => PromoLoaded(Promo)));
      }
    });
  }
}
