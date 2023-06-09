part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginFormSubmit extends LoginEvent{
  final String phone;
  final String security_code;

  LoginFormSubmit(this.phone, this.security_code);
}
