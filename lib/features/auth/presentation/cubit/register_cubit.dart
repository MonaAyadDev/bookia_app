// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookia_app/features/auth/data/repositories/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoding());
    final response = await RegisterRepo.register(
      email: email,
      password: password,
      name: name,
      passwordConfirmation: passwordConfirmation,
    );
    if (response) {
      emit(Registersuccess());
    } else {
      emit(RegisterError());
    }
  }
}
