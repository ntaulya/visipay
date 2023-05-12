import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/data/datasources/remote/auth.dart';
import 'package:visipay/data/model/user.dart';

abstract class AuthRepositories {
  Future<Either<String, User>> login(String phone, String security_code);
  Future<Either<String, User>> register(String phone,String name, String email, String security_code);
}

class AuthRepositoriesImpl extends AuthRepositories{
  final AuthRemoteDatasources remoteDatasources;

  AuthRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, User>> login(String phone, String security_code) async {
    var remote = await remoteDatasources.login(phone, security_code);
    if (remote.isRight()) {
      DateTime exp = DateTime.fromMillisecondsSinceEpoch(1678037656*1000);
      return Right(remote.asRight().user);
    } else {
      return Left(remote.asLeft());
    }
  }

  @override
  Future<Either<String, User>> register(String phone, String name, String email, String security_code) async {
    var remote = await remoteDatasources.register(phone,name,email,security_code);
    if (remote.isRight()) {
      DateTime exp = DateTime.fromMillisecondsSinceEpoch(1678037656*1000);
      return Right(remote.asRight().user);
    } else {
      return Left(remote.asLeft());
    }
  }

}
