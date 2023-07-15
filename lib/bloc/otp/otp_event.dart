part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class SendOtp extends OtpEvent {
  final String phone;

  SendOtp(this.phone);
}

class VerifyOtp extends OtpEvent {
  final String phone, code;

  VerifyOtp(this.phone, this.code);
}
