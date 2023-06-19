import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/model/promo.dart';
import 'package:visipay/data/model/promo_model.dart';

abstract class PromoRemoteDatasources {
  Future<Either<String, List<Promo>>> getPromoList();
  Future<Either<String, Promo>> getPromobyID(String id);
}

class PromoRemoteDatasourcesImpl extends PromoRemoteDatasources {
  @override
  Future<Either<String, List<Promo>>> getPromoList() async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/promos",
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      var data = (body as List<dynamic>).map((promo) => PromoModel.fromJson(promo)).toList();
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
  
  @override
  Future<Either<String, Promo>> getPromobyID(String id) async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/promo?id",
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      var data = PromoModel.fromJson(body);
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
}
