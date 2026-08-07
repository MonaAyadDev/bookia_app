import 'package:bookia_app/core/helper/cache_helper.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  static Dio dio = Dio();
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "https://codingarabic.online/api/login",
        data: {"email": email, "password": password},
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
