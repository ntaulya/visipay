import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/model/charge_response.dart';
import 'package:visipay/data/model/topup_payload_model.dart';
import 'package:visipay/data/repositories/transaction.dart';

part 'topup_e_wallet_event.dart';
part 'topup_e_wallet_state.dart';

class TopupEWalletBloc extends Bloc<TopupEWalletEvent, TopupEWalletState> {
  final TransactionRepositories data;
  
  TopupEWalletBloc(this.data) : super(TopupEWalletLoading()) {
    on<TopupEWalletEvent>((event, emit) async {
      if (event is TopupEWalletInisiate) {
        emit(TopupEWalletLoading());
        final failureOrUser = await data.topupEWallet(event.data);
        emit(failureOrUser.fold((err_message) => TopupEWalletError(err_message), (data) => TopupEWalletLoaded(data: data)));
    }
    });
  }
}
