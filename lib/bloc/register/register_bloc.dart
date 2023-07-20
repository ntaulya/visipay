import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/repositories/auth.dart';

import '../../data/datasources/remote/auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepositories data;
  RegisterBloc({required this.data}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is RegisterFormSubmit) {
        emit(RegisterLoading());
        final failureOrUser =
            await data.register(event.phone, event.name, event.email, event.security_code);
        emit(failureOrUser.fold((l) => RegisterError(l), (r) => RegisterSuccess()));
      }

      if (event is finduser) {
        emit(RegisterLoading());
        try {
          final failureOrUser = await data.finduser(event.phone);
          emit(failureOrUser.fold((l) => RegisterError(l), (r) => userfound()));
        } catch (e) {
          if (e is userNotFoundExceptions) {
            emit(userNotFound());
          }
        }
      }
    });
  }
}
