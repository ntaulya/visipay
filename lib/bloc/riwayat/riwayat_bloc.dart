import 'package:bloc/bloc.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/data/model/riwayat.dart';
import 'package:visipay/data/repositories/riwayat.dart';

import '../../data/repositories/riwayat.dart';

part 'riwayat_event.dart';
part 'riwayat_state.dart';

class RiwayatBloc extends Bloc<RiwayatEvent, RiwayatState> {
  final RiwayatRepositories data;

  RiwayatBloc ({required this.data}) : super(RiwayatLoading()) { //nampilin data pertama kali
    on<RiwayatEvent>((event, emit) async {
      if (event is RiwayatListInisiate) {
        emit(RiwayatLoading());
        final failureOrUser = await data.getRiwayatList(category: event.category);
        final jwt = await getJWT();
        final claims = await getClaims(jwt??'');
        emit(failureOrUser.fold((err_message) => RiwayatError(err_message), (Riwayat) => RiwayatLoaded(Riwayat,claims["user"]["name"])));
        
      }
      if (event is RiwayatDetailInisiate) {
        emit(RiwayatLoading());
        final failureOrUser = await data.getRiwayatbyID(event.id);
        
        emit(failureOrUser.fold((err_message) => RiwayatError(err_message), (Riwayat) => RiwayatLoadedID(Riwayat)));
      }
    });
  }
}
