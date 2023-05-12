class User {
  String name;
  String phone;
  String email;
  String security_code;
  String photo;
  bool email_verified;
  bool phone_verified;
  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.security_code,
    required this.photo,
    required this.email_verified,
    required this.phone_verified,
  });
}