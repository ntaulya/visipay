part of 'produk_bloc.dart';

abstract class ProdukEvent {}

class GetProdukListInisiate extends ProdukEvent {
  final String code;
  final String category;
  final String ? idPelanggan;
  final String ? phone_number;

  GetProdukListInisiate({required this.code, required this.category, this.idPelanggan, this.phone_number,});
}

class initProduk extends ProdukEvent {}
class resetProdukState extends ProdukEvent{}