class AuthRequestBody {
  String? name;
  String email;
  String password;
  String? passwordConfirmation;
  AuthRequestBody({
    required this.email,
     this.name,
    required this.password,
     this.passwordConfirmation,
  });
}
