part of 'riwayat_bloc.dart';

abstract class RiwayatState {}

class RiwayatLoading extends RiwayatState {
}

class RiwayatLoaded extends RiwayatState {
  final List<Riwayat> riwayat;
  final String user;

  RiwayatLoaded(this.riwayat, this.user);
}

class RiwayatLoadedID extends RiwayatState {
  final Riwayat riwayat;

  RiwayatLoadedID(this.riwayat);
}

class RiwayatError extends RiwayatState {
  final String error_message;

  RiwayatError(this.error_message);
}