import 'package:bookia_app/core/helper/cache_helper.dart';
import 'package:bookia_app/core/network/dio_helper.dart';
import 'package:bookia_app/features/auth/data/models/register_request_body.dart';

class LoginRepo {
  static Future<bool> login(AuthRequestBody body) async {
    try {
      var response = await DioHelper.dio.post(
        "login",
        data: {"email": body.email, "password": body.password},
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
