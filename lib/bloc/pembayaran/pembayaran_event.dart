part of 'pembayaran_bloc.dart';

abstract class PembayaranEvent {}

class PembayaranInisiate extends PembayaranEvent {
  final String product_id;
  final String promo_id;
  final String notes;

  PembayaranInisiate({required this.product_id, required this.promo_id, required this.notes});
}

