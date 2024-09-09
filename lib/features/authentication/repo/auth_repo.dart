import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/authentication/data/models/user_model.dart';

class AuthRepo extends Repository {
  final ApiService apiService;

  AuthRepo(this.apiService);

  Future<Either<String, UserModel>> userLogin({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        url: APIEndpoints.signInApi,
        body: {'username': username, 'password': password},
      );

      final responseBody = jsonDecode(response.body);
      log(responseBody.toString());
      if (responseBody['status'] == 'false') {
        return left('هناك خطأ في كلمة السر او البريد الالكتروني');
      }else{
        return right(UserModel.fromJson(responseBody));
      }
    } catch (e) {
      return Left('هناك خطأ في الاتصال بالشبكة');
    }
  }

  Future<Either<String, String>> userRegister({
    required String fname,
    required String lname,
    required String fnum,
    required String lnum,
    required String username,
    required String password,
    required String userClass,
    required String country,
  }) async {
    try {
      final response = await apiService.post(
        url: APIEndpoints.signUpApi,
        body: {
          'fname': fname,
          'lname': lname,
          'fnum': fnum,
          'lnum': lnum,
          'username': username,
          'password': password,
          'class': userClass,
          'country': country,
        },
      );

      final responseBody = jsonDecode(response.body);
      log(responseBody.toString());
      if (responseBody['status'] == 'true') {
        return const Right('Registration successful');
      } else {
        return Left(
            responseBody['error'][0]?.toString() ?? 'Registration failed.');
      }
    } catch (e) {
      return Left('هناك خطأ في الاتصال بالشبكة');
    }
  }
}
