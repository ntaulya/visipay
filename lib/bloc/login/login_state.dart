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
