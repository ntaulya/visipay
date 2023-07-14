import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/datasources/remote/transaction.dart';
import 'package:visipay/data/model/charge_response.dart';
import 'package:visipay/data/model/topup_payload_model.dart';
import 'package:visipay/data/model/transaction_method.dart';


abstract class TransactionRepositories {
  Future<Either<String, List<Transaction_Method>>> getTransactionMethodList();
  Future<Either<String, ChargeResponse>> topupEWallet(TopupPayloadModel data);
  Future<Either<String, ChargeResponse>> cekTransaksi(String id);
}

class TransactionRepositoriesImpl extends TransactionRepositories {
  final TransactionRemoteDatasources remoteDatasources;

  TransactionRepositoriesImpl({required this.remoteDatasources});
  
  @override
  Future<Either<String, List<Transaction_Method>>> getTransactionMethodList() {
    return remoteDatasources.getTransactionMethodList();
  }
  
  @override
  Future<Either<String, ChargeResponse>> topupEWallet(TopupPayloadModel data) {
    return remoteDatasources.topupEWallet(data);
  }
  
  @override
  Future<Either<String, ChargeResponse>> cekTransaksi(String id) {
    return remoteDatasources.cekTransaksi(id);
  }

  
}
