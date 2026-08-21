import 'package:bookia_app/features/auth/data/models/auth_params.dart';
import 'package:bookia_app/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final newPassController = TextEditingController();
  final verifyCodeController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoading());
    final response = await AuthRepo.login(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> forgotPassword() async {
    emit(AuthLoading());
    final response = await AuthRepo.forgetPassword(
      AuthParams(email: emailController.text),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> createPassword() async {
    emit(AuthLoading());
    final response = await AuthRepo.resetPassword(
      AuthParams(
        verifyCode: verifyCodeController.text,
        newPassword: newPassController.text,
        newPasswordConfirmation: passwordConfirmationController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> otpVeritation() async {
    emit(AuthLoading());
    final response = await AuthRepo.checkForgetPassword(
      AuthParams(
        verifyCode: verifyCodeController.text,
        email: emailController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> register() async {
    emit(AuthLoading());
    final response = await AuthRepo.register(
      AuthParams(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        newPasswordConfirmation: passwordConfirmationController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }
}
