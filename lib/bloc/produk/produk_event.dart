part of 'produk_bloc.dart';

abstract class ProdukEvent {}

class GetProdukListInisiate extends ProdukEvent {
  final String code;
  final String category;
  final String idPelanggan;

  GetProdukListInisiate({required this.code, required this.category, required this.idPelanggan});
}

class initProduk extends ProdukEvent {}
class resetProdukState extends ProdukEvent{}