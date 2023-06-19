part of 'produk_bloc.dart';

abstract class ProdukState {}

class ProdukLoading extends ProdukState {}

class ProdukListLoaded extends ProdukState {
  final List<Produk> produk;
  ProdukListLoaded(this.produk);
}

class ProdukDetailLoaded extends ProdukState {
  final Produk produk;
  ProdukDetailLoaded(this.produk);
}

class ProdukError extends ProdukState {
  final String error_message;

  ProdukError(this.error_message);
}
