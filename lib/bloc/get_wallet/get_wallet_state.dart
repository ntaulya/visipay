part of 'get_wallet_bloc.dart';

@immutable
abstract class GetWalletState {}

class GetWalletLoading extends GetWalletState {
}

class GetWalletLoaded extends GetWalletState {
  final Wallet wallet;

  GetWalletLoaded(this.wallet);
}

class GetWalletError extends GetWalletState {
  final String error_message;

  GetWalletError(this.error_message);
}

class UpdateWallet extends GetWalletState {
  
}