part of 'get_profile_bloc.dart';

@immutable
abstract class GetProfileEvent {}

class GetProfileInisiate extends GetProfileEvent {

}

class EditProfileInisiate extends GetProfileEvent {
  final String name;
  final String email;

  EditProfileInisiate(this.name, this.email);
}
