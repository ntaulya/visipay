import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/model/produk.dart';
import 'package:visipay/data/model/produk_model.dart';

abstract class ProdukRemoteDatasources {
  Future<Either<String, List<Produk>>> getProdukList(
      String code, String category, {String ? idPelanggan, String ? phone_number});
}

class ProdukRemoteDatasourcesImpl extends ProdukRemoteDatasources {
  @override
  Future<Either<String, List<Produk>>> getProdukList(
      String code, String category, {String ? idPelanggan, String ? phone_number}) async {
    print(idPelanggan);
    print(category);
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/products",
      payloadQparams: {"code": code, "category": category, "id_pelanggan": idPelanggan, "phone_number" : phone_number},
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body)['data'];
      var data = (body as List<dynamic>).map((produk) => ProdukModel.fromJson(produk)).toList();
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
}
