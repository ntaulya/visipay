import 'package:visipay/data/model/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.phone, required super.email, required super.security_code, required super.photo, required super.email_verified, required super.phone_verified});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone' : phone,
      'email' : email,
      'security_code' : security_code,
      'photo' : photo,
      'email_verified' : email_verified,
      'phone_verified' : phone_verified
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      email:json['email'],
      security_code:'',
      photo:'',
      email_verified:false,
      phone_verified:false,
    );
  }
}