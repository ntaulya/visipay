part of 'get_profile_bloc.dart';

@immutable
abstract class GetProfileState {}

class GetProfileLoading extends GetProfileState {
}

class GetProfileLoaded extends GetProfileState {
  final User user;

  GetProfileLoaded(this.user);
}

class GetProfileError extends GetProfileState {
  final String error_message;

  GetProfileError(this.error_message);
}