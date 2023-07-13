import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';

abstract class PembayaranRemoteDatasources {
  Future<Either<String, String>> insertPembayaran(
      String product_id, String promo_id, String notes);
}

class PembayaranRemoteDatasourcesImpl extends PembayaranRemoteDatasources {
  @override
  Future<Either<String, String>> insertPembayaran(
      String product_id, String promo_id, String notes) async {
    
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/transaction",
      payloadJson: {"product_id": product_id, "promo_id": promo_id.isEmpty?null:promo_id, "notes": notes},
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      
      return Future.value(Right('berhasil horee'));
    } else {
      return Future.value(Left(''));
    }
  }
}
