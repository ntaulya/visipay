import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/repositories/profile.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final ProfileRepositories data;
  
  EditProfileBloc(this.data) : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) async {
      if (event is EditProfileInisiate) {
        emit(EditProfileLoading());
        final failureOrUser = await data.editProfile(event.name,event.email);
        emit(failureOrUser.fold((err_message) => EditProfileError(err_message), (user) => EditProfileSuccess()));
      }
    });
  }
}
