// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookia_app/features/auth/data/models/register_request_body.dart';
import 'package:bookia_app/features/auth/data/repositories/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(AuthRequestBody body) async {
    emit(RegisterLoding());
    final response = await RegisterRepo.register(body);
    if (response) {
      emit(Registersuccess());
    } else {
      emit(RegisterError());
    }
  }
}
