import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/data/repositories/auth.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepositories data;
  OtpBloc(this.data) : super(OtpInitial()) {
    on<OtpEvent>((event, emit) async {
      if (event is SendOtp) {
        emit(OtpLoading());
        final response = await data.sendOtp(event.phone);
        response.fold((l) => emit(SendOtpError()), (r) => emit(SendOtpSuccess()));
      } else if (event is VerifyOtp) {
        emit(OtpLoading());
        final response = await data.verifyOtp(event.phone, event.code);
        response.fold((l) => emit(VerifyOtpError()), (r) => emit(VerifyOtpSuccess()));
      }
    });
  }
}
