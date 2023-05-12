import 'package:visipay/data/model/user.dart';

class UserSession {
  final User user;
  final String access_token;
  final DateTime expired_at;

  UserSession({required this.user, required this.access_token, required this.expired_at});
}
