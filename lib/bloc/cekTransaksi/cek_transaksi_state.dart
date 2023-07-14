part of 'cek_transaksi_bloc.dart';

abstract class CekTransaksiState {}

class CekTransaksiLoading extends CekTransaksiState {
}

class CekTransaksiLoaded extends CekTransaksiState {
  final ChargeResponse data;

  CekTransaksiLoaded({
    required this.data
  });
}

class CekTransaksiError extends CekTransaksiState {
  final String error_message;

  CekTransaksiError(this.error_message);
}
