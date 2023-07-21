import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/datasources/remote/auth.dart';
import 'package:visipay/data/repositories/auth.dart';
import 'package:visipay/data/repositories/wallet.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositories data;
  final WalletRepositories walletrepositories;

  LoginBloc({required this.data, required this.walletrepositories}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginFormSubmit) {
        emit(LoginLoading());
        final failureOrUser = await data.login(event.phone, event.security_code);
        failureOrUser.fold((l) {
          emit(LoginError(l));
        }, (r) async {
          emit(LoginSuccess());
        });
      }
      if (event is finduser) {
        emit(LoginLoading());
        try {
          final failureOrUser = await data.finduser(event.phone);
          emit(failureOrUser.fold((l) => LoginError(l), (r) => userfound(r.phone)));
        } catch (e) {
          if (e is userNotFoundExceptions) {
            emit(userNotFound());
          }
        }
      }

      if (event is userPIN) {
        emit(LoginLoading());
        try {
          final failureOrUser = await data.verifyPIN(event.security_code);
          emit(failureOrUser.fold((l) => LoginError(l), (r) => LoginSuccess()));
        } catch (e) {
          if (e is userNotFoundExceptions) {
            emit(userNotFound());
          }
        }
      }
    });
  }
}
