import 'dart:convert';
import 'package:visipay/data/model/user_model.dart';
import 'package:visipay/data/model/user_session.dart';

class UserSessionModel extends UserSession {
  UserSessionModel({required super.user, required super.access_token, required super.expired_at});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
  
    result.addAll({'user': (user as UserModel).toJson()});
    result.addAll({'access_token': access_token});
    result.addAll({'expired_at': expired_at.millisecondsSinceEpoch});
  
    return result;
  }

  factory UserSessionModel.fromJson(Map<String, dynamic> map) {
    return UserSessionModel(
      user: UserModel.fromJson(map['data']),
      access_token: map['access_token'] ?? '',
      expired_at: DateTime.now(),
    );
  }
}
