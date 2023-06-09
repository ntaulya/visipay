part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

//kondisi awal
class RegisterInitial extends RegisterState {}

//lagi proses
class RegisterLoading extends RegisterState {}

//kalau gagal
class RegisterError extends RegisterState {
  final String error_message;

  RegisterError(this.error_message);
}

//kalau berhasil
class RegisterSuccess extends RegisterState {}
