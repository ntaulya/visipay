import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/datasources/remote/riwayat.dart';
import 'package:visipay/data/model/riwayat.dart';


abstract class RiwayatRepositories {
  Future<Either<String, List<Riwayat>>> getRiwayatList();
  Future<Either<String, Riwayat>> getRiwayatbyID(String id);
}

class RiwayatRepositoriesImpl extends RiwayatRepositories {
  final RiwayatRemoteDatasources remoteDatasources;

  RiwayatRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, List<Riwayat>>> getRiwayatList() async {
    return remoteDatasources.getRiwayatList();
  }

  @override
  Future<Either<String, Riwayat>> getRiwayatbyID(String id) {
    return remoteDatasources.getRiwayatbyID(id);
  }
}