import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/core/helper/jwt.dart';

part 'page_navigation_event.dart';
part 'page_navigation_state.dart';

class PageNavigationBloc extends Bloc<PageNavigationEvent, PageNavigationState> {
  PageNavigationBloc() : super(PageNavigationInitial()) {
    on<PageNavigationEvent>((event, emit) async {
      if (event is PageNavigationFormSubmit) {
        emit(PageNavigationLoading());
        final jwt = await getJWT();
        if (jwt == null || jwt.isEmpty) {
          emit(PageNavigationError("error_message"));
        } else {
          emit(PageNavigationSuccess());
        }
      }
    });
  }
}
