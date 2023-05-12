part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class RegisterFormSubmit extends LoginEvent{
  final String phone;
  final String security_code;

  RegisterFormSubmit(this.phone, this.security_code);
}
