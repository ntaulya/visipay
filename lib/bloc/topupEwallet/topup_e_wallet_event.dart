part of 'topup_e_wallet_bloc.dart';

abstract class TopupEWalletEvent {}

class TopupEWalletInisiate extends TopupEWalletEvent{
  final TopupPayloadModel data;

  TopupEWalletInisiate(this.data);
}
