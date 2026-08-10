import 'package:bookia_app/core/helper/cache_helper.dart';
import 'package:bookia_app/core/network/dio_helper.dart';
import 'package:bookia_app/features/auth/data/models/register_request_body.dart';

class RegisterRepo {
  static Future<bool> register(AuthRequestBody body) async {
    try {
      var response = await DioHelper.dio.post(
        "register",
        data: {
          "name": body.name,
          "email": body.email,
          "password": body.password,
          "password_confirmation": body.passwordConfirmation,
        },
      );
      if (response.statusCode == 201) {
        String token = response.data['data']['token'];
        await CacheHelper.setData(key: 'token', value: token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
