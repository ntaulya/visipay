part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpLoading extends OtpState {}
class SendOtpSuccess extends OtpState {}
class SendOtpError extends OtpState {}
class VerifyOtpSuccess extends OtpState {}
class VerifyOtpError extends OtpState {}