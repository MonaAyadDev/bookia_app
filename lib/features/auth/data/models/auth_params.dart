class AuthParams {
  String? name;
  String? email;
  String? password;
  String? verifyCode;
  String? newPassword;
  String? newPasswordConfirmation;
  AuthParams({
    this.name,
    this.email,
    this.password,
    this.verifyCode,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': newPasswordConfirmation,
  };
}
