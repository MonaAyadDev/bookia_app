import 'user.dart';

class AuthRespons {
  User? user;
  String? token;

  AuthRespons({this.user, this.token});

  factory AuthRespons.fromJson(Map<String, dynamic> json) => AuthRespons(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );
}
