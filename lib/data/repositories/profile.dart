import 'dart:convert';
import 'dart:core';
import 'package:dartz/dartz.dart';
import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/core/helper/api_request.dart';
import 'package:visipay/data/datasources/remote/auth.dart';
import 'package:visipay/data/datasources/remote/profile.dart';
import 'package:visipay/data/model/user.dart';
import 'package:visipay/data/model/user_model.dart';

abstract class ProfileRepositories {
  Future<Either<String, User>> getProfile();
  Future<Either<String, User>> editProfile(String name, String email);
}


class ProfileRepositoriesImpl extends ProfileRepositories{
  final ProfileRemoteDatasources remoteDatasources;

  ProfileRepositoriesImpl({required this.remoteDatasources});

  @override
  Future<Either<String, User>> getProfile() async {
    return remoteDatasources.getProfile();
  }
  
  @override
  Future<Either<String, User>> editProfile(String name, String email) {
    return remoteDatasources.editProfile(name, email);
  }



}
