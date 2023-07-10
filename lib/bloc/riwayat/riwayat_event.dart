part of 'riwayat_bloc.dart';

abstract class RiwayatEvent {}

class RiwayatListInisiate extends RiwayatEvent{}

class RiwayatDetailInisiate extends RiwayatEvent{
  final String id;

  RiwayatDetailInisiate(this.id);
}
