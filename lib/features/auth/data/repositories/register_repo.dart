import 'package:bookia_app/core/helper/cache_helper.dart';
import 'package:dio/dio.dart';

class RegisterRepo {
  static Dio dio = Dio();
  static Future<bool> register({
    required String email,
    required String password,
    required String name,
    required String passwordConfirmation,
  }) async {
    try {
      var response = await dio.post(
        "https://codingarabic.online/api/login",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      if (response.statusCode == 200) {
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
