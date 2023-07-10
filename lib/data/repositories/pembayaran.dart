import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/datasources/remote/pembayaran.dart';
import 'package:visipay/data/datasources/remote/promo.dart';
import 'package:visipay/data/model/promo.dart';

abstract class PembayaranRepositories {
  Future<Either<String, String>> insertPembayaran(String product_id, String promo_id, String notes);
}

class PembayaranRepositoriesImpl extends PembayaranRepositories {
  final PembayaranRemoteDatasources remoteDatasources;

  PembayaranRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, String>> insertPembayaran(String product_id, String promo_id, String notes) async {
    return remoteDatasources.insertPembayaran(product_id, promo_id, notes);
  }
}
