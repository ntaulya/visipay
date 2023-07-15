import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/core/extension/dartz_x.dart';
import 'package:visipay/data/repositories/profile.dart';

import '../../data/model/user.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  final ProfileRepositories data;

  GetProfileBloc ({required this.data}) : super(GetProfileLoading()) { //nampilin data pertama kali
    on<GetProfileEvent>((event, emit) async {
      if (event is GetProfileInisiate) {
        emit(GetProfileLoading());
        final failureOrUser = await data.getProfile();
        // if(failureOrUser.isLeft()){
        //   emit(GetProfileError(failureOrUser.asLeft()));
        // } else {
        //   emit(GetProfileLoaded(failureOrUser.asRight()));
        // }
        emit(failureOrUser.fold((err_message) => GetProfileError(err_message), (user) => GetProfileLoaded(user)));
      }
      
    });
  }
}
