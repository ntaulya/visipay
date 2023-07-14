import 'package:bloc/bloc.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/data/model/riwayat.dart';
import 'package:visipay/data/model/transaction_method.dart';
import 'package:visipay/data/repositories/riwayat.dart';
import 'package:visipay/data/repositories/transaction.dart';

import '../../data/repositories/riwayat.dart';

part 'transaction_method_event.dart';
part 'transaction_method_state.dart';

class TransactionMethodBloc extends Bloc<TransactionMethodEvent, TransactionMethodState> {
  final TransactionRepositories data;

  TransactionMethodBloc ({required this.data}) : super(TransactionMethodLoading()) { //nampilin data pertama kali
    on<TransactionMethodEvent>((event, emit) async {
      if (event is TransactionMethodListInisiate) {
        emit(TransactionMethodLoading());
        final failureOrUser = await data.getTransactionMethodList();
        emit(failureOrUser.fold((err_message) => TransactionMethodError(err_message), (data) => TransactionMethodLoaded(items: data)));
    }});
  }
}
