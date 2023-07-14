import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/model/charge_response.dart';
import 'package:visipay/data/repositories/transaction.dart';

part 'cek_transaksi_event.dart';
part 'cek_transaksi_state.dart';

class CekTransaksiBloc extends Bloc<CekTransaksiEvent, CekTransaksiState> {
  final TransactionRepositories repositori;

  CekTransaksiBloc(this.repositori) : super(CekTransaksiLoading()) {
    on<CekTransaksiEvent>((event, emit) async {
      if (event is CekTransaksiInisiate) {
        emit(CekTransaksiLoading());
        final failureOrUser = await repositori.cekTransaksi(event.id);
        emit(failureOrUser.fold((err_message) => CekTransaksiError(err_message), (data) => CekTransaksiLoaded(data: data)));
      }
    });
  }
}
