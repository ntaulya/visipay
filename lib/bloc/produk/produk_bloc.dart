import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/model/produk.dart';
import 'package:visipay/data/repositories/auth.dart';

import '../../data/repositories/produk.dart';

part 'produk_event.dart';
part 'produk_state.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  final ProdukRepositories data;
  ProdukBloc({required this.data}) : super(ProdukLoading()) {
    on<ProdukEvent>((event, emit) async {
      if (event is GetProdukListInisiate) {
        emit(ProdukLoading());
        final failureOrUser =
            await data.getProdukList(event.code, event.category, event.idPelanggan);
        emit(failureOrUser.fold((l) => ProdukError(l), (r) => ProdukListLoaded(r)));
      }
      if (event is initProduk) {
        emit(ProdukLoading());
      }
    });
  }
}
