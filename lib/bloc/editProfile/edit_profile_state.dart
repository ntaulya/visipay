part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String error_message;

  EditProfileError(this.error_message);
}

class EditProfileSuccess extends EditProfileState {}

class EditProfileInitial extends EditProfileState {
  
}