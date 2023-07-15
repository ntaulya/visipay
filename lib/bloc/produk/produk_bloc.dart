import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/data/model/produk.dart';
import 'package:visipay/data/repositories/auth.dart';

import '../../data/repositories/produk.dart';

part 'produk_event.dart';
part 'produk_state.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  final ProdukRepositories data;
  ProdukBloc({required this.data}) : super(ProdukInitial()) {
    on<ProdukEvent>((event, emit) async {
      if (event is GetProdukListInisiate) {
        emit(ProdukLoading());
        final failureOrUser = await data.getProdukList(
            event.code, event.category, idPelanggan: event.idPelanggan, phone_number: event.phone_number);
        final jwt = await getJWT();
        final claims = await getClaims(jwt ?? '');
        emit(
          failureOrUser.fold((l) => ProdukError(l), (r) {
            r.sort((a,b)=>a.price-b.price);
            return ProdukListLoaded(
              r,
              claims["user"]["name"],
            );
          }),
        );
      }
      if (event is initProduk) {
        emit(ProdukLoading());
      }
      if (event is resetProdukState) {
        emit(ProdukInitial());
      }
    });
  }
}
