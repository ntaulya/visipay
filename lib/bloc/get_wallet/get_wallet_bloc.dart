// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:visipay/data/repositories/wallet.dart';

import '../../data/model/wallet.dart';

part 'get_wallet_event.dart';
part 'get_wallet_state.dart';

class GetWalletBloc extends Bloc<GetWalletEvent, GetWalletState> {
  WalletRepositories data;
  GetWalletBloc(
    this.data,
  ) : super(GetWalletLoading()) {
    on<GetWalletEvent>((event, emit) async {
      if (event is GetWalletInisiate) {
        emit(GetWalletLoading());
        final failureOrUser = await data.getWallet();
        emit(failureOrUser.fold((err_message) => GetWalletError(err_message), (Wallet) => GetWalletLoaded(Wallet)));
      }
    });
  }
}
