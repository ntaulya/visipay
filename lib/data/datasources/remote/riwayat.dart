import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/model/riwayat.dart';
import 'package:visipay/data/model/riwayat_model.dart';

abstract class RiwayatRemoteDatasources {
  Future<Either<String, List<Riwayat>>> getRiwayatList();
  Future<Either<String, Riwayat>> getRiwayatbyID(String id);
}

class RiwayatRemoteDatasourcesImpl extends RiwayatRemoteDatasources {
  @override
  Future<Either<String, List<Riwayat>>> getRiwayatList() async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/transactions",
      payloadQparams: {"limit":"10","page":"1"},
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      var data = (body as List<dynamic>).map((riwayat) => RiwayatModel.fromJson(riwayat)).toList();
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }

  @override
  Future<Either<String, Riwayat>> getRiwayatbyID(String id) async {
    var response =
        await ApiRequest(method: API_METHODS.GET, path: "/api/transactions", payloadQparams: {"transaction_id": id});
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      var data = RiwayatModel.fromJson(body[0]);
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
  
}
