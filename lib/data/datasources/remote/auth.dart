import 'dart:convert';

import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:visipay/data/model/user.dart';
import 'package:visipay/data/model/user_model.dart';
import 'package:visipay/data/model/user_session.dart';
import 'package:visipay/data/model/user_session_model.dart';

abstract class AuthRemoteDatasources {
  Future<Either<String, UserSession>> login(String phone, String security_code);
  Future<Either<String, UserSession>> register(
      String phone, String name, String email, String security_code);
  Future<Either<String, User>> finduser(String phone);
  Future<Either<String, String>> sendOtp(String phone);
  Future<Either<String, String>> verifyOtp(String phone, String otp);
}

class AuthRemoteDatasourcesImpl extends AuthRemoteDatasources {
  @override
  Future<Either<String, UserSession>> login(String phone, String security_code) async {
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/user/login",
      payloadJson: {"phone": phone, "security_code": int.parse(security_code)},
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      if ((body['message'] as String).toLowerCase().contains('login')) {
        var data = UserSessionModel.fromJson(body);
        return Future.value(Right(data));
      } else {
        return Future.value(Left(''));
      }
    } else {
      return Future.value(Left(''));
    }
  }

  @override
  Future<Either<String, UserSession>> register(
      String phone, String name, String email, String security_code) async {
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/user/register",
      payloadJson: {
        "name": name,
        "email": email,
        "security_code": int.parse(security_code),
        "phone": phone,
      },
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      var body = json.decode(response.asRight().body);
      if ((body['message'] as String).toLowerCase().contains('register')) {
        var data = UserSessionModel.fromJson(body);

        return Future.value(Right(data));
      } else {
        return Future.value(Left(''));
      }
    } else {
      return Future.value(Left(''));
    }
  }

  @override
  Future<Either<String, User>> finduser(String phone) async {
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/user",
      payloadJson: {
        "phone": phone,
      },
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
  Future<Either<String, String>> sendOtp(String phone) async {
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/user/otp",
      payloadJson: {
        "phone": phone,
      },
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      return Future.value(Right('Success'));
    } else {
      return Future.value(Left('Fail'));
    }
  }

  @override
  Future<Either<String, String>> verifyOtp(String phone, String otp) async {
    var response = await ApiRequest(
      method: API_METHODS.POST,
      path: "/api/user/verify",
      payloadJson: {
        "phone": phone,
        "otp": otp,
      },
    );
    print(response.asRight().body);
    if (response.asRight().statusCode == 200) {
      return Future.value(Right('Success'));
    } else {
      return Future.value(Left('Fail'));
    }
  }
}
