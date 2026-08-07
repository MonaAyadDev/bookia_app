import 'package:bookia_app/features/auth/data/repositories/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await LoginRepo.login(email: email, password: password);
    if (response) {
      emit(LoginSuccess());
    } else {
      emit(LoginError());
    }
  }
}