part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class EditProfileInisiate extends EditProfileEvent {
  final String name;
  final String email;

  EditProfileInisiate(this.name, this.email);
}
