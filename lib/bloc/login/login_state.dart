// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String error_message;

  LoginError(this.error_message);
}

class LoginSuccess extends LoginState {}

class userfound extends LoginState {
  final String phone;
  userfound(this.phone);
}
