import 'dart:convert';
import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:visipay/data/datasources/remote/auth.dart';
import 'package:visipay/data/datasources/remote/profile.dart';
import 'package:visipay/data/datasources/remote/wallet.dart';
import 'package:visipay/data/model/user.dart';
import 'package:visipay/data/model/user_model.dart';
import 'package:visipay/data/model/wallet.dart';

abstract class WalletRepositories {
  Future<Either<String, Wallet>> getWallet();
  Future<Either<String, String>> createWallet();
}


class WalletRepositoriesImpl extends WalletRepositories{
  final WalletRemoteDatasources remoteDatasources;

  WalletRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, Wallet>> getWallet() async {
    return remoteDatasources.getWallet();
  }
  
  @override
  Future<Either<String, String>> createWallet() {
    return remoteDatasources.createWallet();
  }
  
}
