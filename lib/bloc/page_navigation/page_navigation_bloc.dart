import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visipay/core/helper/jwt.dart';

part 'page_navigation_event.dart';
part 'page_navigation_state.dart';

class PageNavigationBloc extends Bloc<PageNavigationEvent, PageNavigationState> {
  PageNavigationBloc() : super(PageNavigationInitial()) {
    on<PageNavigationEvent>((event, emit) async {
      if (event is PageNavigationAuthentication) {
        emit(PageNavigationLoading());
        final jwt = await getJWT();
        final claims = await getClaims(jwt??'');
        if (claims['exp']==null) {
          emit(PageNavigationError("error_message"));
        } else {
          var exp_date = DateTime.fromMillisecondsSinceEpoch(claims['exp']*1000);
          print(exp_date);
          if (exp_date.isAfter(DateTime.now())) {
            emit(PageNavigationSuccess());
          } else {
            emit(PageNavigationError("error_message"));
          }
          
        }
        
      }
    });
  }
}
