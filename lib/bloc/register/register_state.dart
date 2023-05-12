part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final String error_message;

  RegisterError(this.error_message);
}

class RegisterSuccess extends RegisterState {}
