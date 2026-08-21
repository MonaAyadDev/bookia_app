// ignore_for_file: avoid_print

import 'package:bookia_app/core/helper/cache_helper.dart';
import 'package:bookia_app/core/network/apis.dart';
import 'package:bookia_app/core/network/dio_helper.dart';
import 'package:bookia_app/features/auth/data/models/auth_params.dart';
import 'package:bookia_app/features/auth/data/models/auth_respons/auth_response.dart';

class AuthRepo {
  static Future<AuthRespons?> login(AuthParams data) async {
    try {
      var response = await DioHelper.post(
        endPoint: Apis.login,
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        String token = response.data['data']['token'];
        await CacheHelper.setData(key: 'token', value: token);
        AuthRespons data = AuthRespons.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      return null;
    }
  }

  static Future<AuthRespons?> forgetPassword(AuthParams data) async {
    try {
      var response = await DioHelper.post(
        endPoint: Apis.forgetPassword,
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        String token = response.data['data']['token'];
        await CacheHelper.setData(key: 'token', value: token);
        AuthRespons data = AuthRespons.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      return null;
    }
  }

  static Future<AuthRespons?> checkForgetPassword(AuthParams data) async {
    try {
      var response = await DioHelper.post(
        endPoint: Apis.checkForgetPassword,
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        String token = response.data['data']['token'];
        await CacheHelper.setData(key: 'token', value: token);
        AuthRespons data = AuthRespons.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      return null;
    }
  }

  static Future<AuthRespons?> resetPassword(AuthParams data) async {
    try {
      var response = await DioHelper.post(
        endPoint: Apis.resetPassword,
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        String token = response.data['data']['token'];
        await CacheHelper.setData(key: 'token', value: token);
        AuthRespons data = AuthRespons.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      return null;
    }
  }

  static Future<AuthRespons?> register(AuthParams data) async {
    try {
      var response = await DioHelper.post(
        endPoint: Apis.register,
        data: data.toJson(),
      );
      if (response.statusCode == 201) {
        String token = response.data['data']['token'];
        await CacheHelper.setData(key: 'token', value: token);
        AuthRespons data = AuthRespons.fromJson(response.data['data']);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      return null;
    }
  }
}
