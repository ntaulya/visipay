import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/core/helper/jwt.dart';
import 'package:visipay/data/model/user.dart';
import 'package:visipay/data/model/user_model.dart';
import 'package:visipay/data/model/user_session.dart';
import 'package:visipay/data/model/user_session_model.dart';

abstract class ProfileRemoteDatasources {
  Future<Either<String, User>> getProfile();
  Future<Either<String, User>> editProfile(String name, String email);
}

class ProfileRemoteDatasourcesImpl extends ProfileRemoteDatasources {
  @override
  Future<Either<String, User>> getProfile() async {
    var response = await ApiRequest(
      method: API_METHODS.GET,
      path: "/api/user",
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      var data = UserModel.fromJson(body['user']);
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }
  
  @override
  Future<Either<String, User>> editProfile(String name, String email) async {
    var response = await ApiRequest(
      method: API_METHODS.PUT,
      path: "/api/user",
      payloadJson: {'name':name, 'email':email},
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      await saveJWT(body['access_token']);
      var data = UserModel.fromJson(body['data']);
      return Future.value(Right(data));
    } else {
      return Future.value(Left(''));
    }
  }


}
