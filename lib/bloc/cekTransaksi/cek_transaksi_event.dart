part of 'cek_transaksi_bloc.dart';

@immutable
abstract class CekTransaksiEvent {}

class CekTransaksiInisiate extends CekTransaksiEvent {
  final String id;

  CekTransaksiInisiate(this.id);
}