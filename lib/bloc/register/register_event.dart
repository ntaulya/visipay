part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterFormSubmit extends RegisterEvent{
  final String phone;
  final String name;
  final String email;
  final String security_code;

  RegisterFormSubmit(this.phone, this.name, this.email, this.security_code);
}
