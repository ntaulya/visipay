import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/datasources/remote/promo.dart';
import 'package:visipay/data/model/promo.dart';

abstract class PromoRepositories {
  Future<Either<String, List<Promo>>> getPromoList();
  Future<Either<String, Promo>> getPromobyID(String id);
}

class PromoRepositoriesImpl extends PromoRepositories {
  final PromoRemoteDatasources remoteDatasources;

  PromoRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, List<Promo>>> getPromoList() async {
    return remoteDatasources.getPromoList();
  }

  @override
  Future<Either<String, Promo>> getPromobyID(String id) {
    return remoteDatasources.getPromobyID(id);
  }
}
