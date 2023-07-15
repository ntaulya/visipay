import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/datasources/remote/produk.dart';
import 'package:visipay/data/model/produk.dart';

abstract class ProdukRepositories {
  Future<Either<String, List<Produk>>> getProdukList(
      String code, String category, {String ? idPelanggan, String ? phone_number});
}

class ProdukRepositoriesImpl extends ProdukRepositories {
  final ProdukRemoteDatasources remoteDatasources;

  ProdukRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, List<Produk>>> getProdukList(
      String code, String category, {String ? idPelanggan, String ? phone_number}) async {
    return remoteDatasources.getProdukList(code, category, idPelanggan : idPelanggan, phone_number : phone_number);
  }
}
