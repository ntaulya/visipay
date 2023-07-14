part of 'topup_e_wallet_bloc.dart';

abstract class TopupEWalletState {}

class TopupEWalletLoading extends TopupEWalletState {
}

class TopupEWalletLoaded extends TopupEWalletState {
  final ChargeResponse data;

  TopupEWalletLoaded({
    required this.data
  });
}

class TopupEWalletError extends TopupEWalletState {
  final String error_message;

  TopupEWalletError(this.error_message);
}