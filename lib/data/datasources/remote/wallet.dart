import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/model/user.dart';
import 'package:visipay/data/model/user_model.dart';
import 'package:visipay/data/model/user_session.dart';
import 'package:visipay/data/model/user_session_model.dart';
import 'package:visipay/data/model/wallet.dart';
import 'package:visipay/data/model/wallet_model.dart';

abstract class WalletRemoteDatasources {
  Future<Either<String, Wallet>> getWallet();
  // Future<Either<String, Wallet>> updateWallet();
}

class WalletRemoteDatasourcesImpl extends WalletRemoteDatasources {
  @override
  Future<Either<String, Wallet>> getWallet() async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/wallet",
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      var data = WalletModel.fromJson(body['data']);
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
  
  
  // Future<Either<String, User>> updateWallet(String name, String email) async {
  //   var response = await ApiRequest(
  //     method: API_METHODS.PUT,
  //     path: "/api/user",
  //     payloadJson: {'name':name, 'email':email},
  //   );
  //   print(response.asRight().body);
  //   if (response.asRight().statusCode == 200) {
  //     var body = json.decode(response.asRight().body);
  //     var data = UserModel.fromJson(body['data']);
  //     return Future.value(Right(data));
  //   } else {
  //     return Future.value(Left(''));
  //   }
  // }
  
  // @override
  // Future<Either<String, Wallet>> updateWallet() {
  //   // TODO: implement updateWallet
  //   throw UnimplementedError();
  // }


}
