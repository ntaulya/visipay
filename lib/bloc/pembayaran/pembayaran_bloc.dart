import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/data/datasources/remote/pembayaran.dart';
import 'package:visipay/data/model/produk.dart';
import 'package:visipay/data/repositories/auth.dart';

import '../../data/repositories/pembayaran.dart';

part 'pembayaran_event.dart';
part 'pembayaran_state.dart';

class PembayaranBloc extends Bloc<PembayaranEvent, PembayaranState> {
  final PembayaranRepositories data;
  PembayaranBloc({required this.data}) : super(PembayaranInitial()) {
    on<PembayaranEvent>((event, emit) async {
      if (event is PembayaranInisiate) {
        emit(PembayaranLoading());
        try {
          final failureOrUser = await data.insertPembayaran(
              event.product_id, event.promo_id, event.notes,
              billing_number: event.billing_number);

          emit(failureOrUser.fold((l) => PembayaranError(l), (r) => PembayaranSuccess(r)));
        } catch (e) {
          if (e is balanceInsufficentExceptions) {
            emit(BalanceInsufficent());
          }
        }
      }
    });
  }
}
