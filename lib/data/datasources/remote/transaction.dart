import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/model/charge_response.dart';
import 'package:visipay/data/model/charge_response_model.dart';
import 'package:visipay/data/model/promo.dart';
import 'package:visipay/data/model/promo_model.dart';
import 'package:visipay/data/model/topup_payload.dart';
import 'package:visipay/data/model/topup_payload_model.dart';
import 'package:visipay/data/model/transaction_method.dart';
import 'package:visipay/data/model/transaction_method_model.dart';

abstract class TransactionRemoteDatasources {
  Future<Either<String, List<Transaction_Method>>> getTransactionMethodList();
  Future<Either<String, ChargeResponse>> topupEWallet(TopupPayloadModel data);
  Future<Either<String, ChargeResponse>> cekTransaksi(String id);
}

class TransactionRemoteDatasourcesImpl extends TransactionRemoteDatasources {
  
  @override
  Future<Either<String, List<Transaction_Method>>> getTransactionMethodList() async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/transaction/methods",
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      var data = (body as List<dynamic>).map((transaction) => Transaction_Method_Model.fromJson(transaction)).toList();
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
  
  @override
  Future<Either<String, ChargeResponse>> topupEWallet(TopupPayloadModel data) async {
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/charge",
      payloadJson: data.toJson(),
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      return Future.value(Right(ChargeResponseModel.fromJson(body)));
    } else {
      return Future.value(Left(''));
    }
  }
  
  @override
  Future<Either<String, ChargeResponse>> cekTransaksi(String id) async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/transaction",
      payloadQparams: {"transaction_id": id},
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      return Future.value(Right(ChargeResponseModel.fromJson(body)));
    } else {
      return Future.value(Left(''));
    }
  }
}
