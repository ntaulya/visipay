part of 'pembayaran_bloc.dart';

abstract class PembayaranState {}

class PembayaranInitial extends PembayaranState {}

class PembayaranLoading extends PembayaranState {}

class PembayaranSuccess extends PembayaranState {
  final String pembayaran;
  PembayaranSuccess(this.pembayaran);
}

class PembayaranError extends PembayaranState {
  final String error_message;

  PembayaranError(this.error_message);
}

class BalanceInsufficent extends PembayaranState {}
