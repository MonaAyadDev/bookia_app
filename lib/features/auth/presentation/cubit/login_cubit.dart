import 'package:bookia_app/features/auth/data/models/register_request_body.dart';
import 'package:bookia_app/features/auth/data/repositories/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(AuthRequestBody body) async {
    emit(LoginLoading());
    final response = await LoginRepo.login(body);
    if (response) {
      emit(LoginSuccess());
    } else {
      emit(LoginError());
    }
  }
}