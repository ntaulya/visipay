part of 'riwayat_bloc.dart';

abstract class RiwayatEvent {}

class RiwayatListInisiate extends RiwayatEvent{
  final String ? category;

  RiwayatListInisiate({this.category});
}

class RiwayatDetailInisiate extends RiwayatEvent{
  final String id;

  RiwayatDetailInisiate(this.id);
}
