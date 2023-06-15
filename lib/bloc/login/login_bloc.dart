import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/repositories/auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositories data;
  LoginBloc ({required this.data}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginFormSubmit) {
        emit(LoginLoading());
        final failureOrUser = await data.login(event.phone, event.security_code);
        emit(failureOrUser.fold((l) => LoginError(l), (r) => LoginSuccess()));
      }
      if (event is finduser) {
        emit(LoginLoading());
        final failureOrUser = await data.finduser(event.phone);
        emit(failureOrUser.fold((l) => LoginError(l), (r) => userfound(r.phone)));
      }
    });
  }
}
