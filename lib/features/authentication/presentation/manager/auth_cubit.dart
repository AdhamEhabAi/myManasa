import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/authentication/data/models/user_model.dart';
import 'package:my_manasa/features/authentication/presentation/views/change_password_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/features/authentication/presentation/views/email_code_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  List<String> numbers = [
    '+201287333487',
    '+201211193993',
    '+201555555555',
    '+201279470626',
    '+201153545019',
    '+201556885559',
    '+201103669650',
    '+201279433209',
    '+201027851328',
  ];

  String generatedOTP = '';
  ApiService apiService = ApiService();
  UserModel? userModel;
  GlobalKey<FormState> registerFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController fPhone = TextEditingController();
  TextEditingController lPhone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  void verifyPhoneNumber(String phoneNumber) {
    if (numbers.contains(phoneNumber)) {
      generatedOTP = '123456';
      emit(PhoneNumberFound());
      Get.to(const EmailCodeView());
    } else {
      generatedOTP = generateOTP();
      //  send otp Sms by service
      print(generatedOTP);
      emit(PhoneNumberNotFound());
      Get.to(const EmailCodeView());
    }
  }

  void verifyOTP(String otp) {
    if (otp == generatedOTP) {
      emit(PhoneNumberOTPValid());
      Get.to(const ChangePasswordView());
    } else {
      emit(PhoneNumberOTPNOTValid());
      Get.showSnackbar(
        GetSnackBar(
          messageText: Text(
            'الكود خطأ',
            style: Styles.semiBold14.copyWith(color: Colors.white),
          ),
        ),
      );
    }
  }

  String generateOTP() {
    Random random = Random();
    int otp = random.nextInt(900000) + 100000;
    return otp.toString();
  }

  Future<void> userRegister() async {
    try {
      emit(RegisterLoading());

      final http.Response response = await apiService.post(url: signUpApi, body: {
        'fname': fName.text,
        'lname': lName.text,
        'fnum': fPhone.text,
        'lnum': lPhone.text,
        'username': email.text,
        'password': password.text,
        'class': '1',
        'country': '1',
      });

      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == 'true') {
        emit(RegisterSuccess());
        trans.Get.to(const LoginView(), transition: trans.Transition.fadeIn);
      } else if (data['status'] == 'false') {
        if (data.containsKey('error')) {
          emit(RegisterFailure(errMessage: data['error'][0].toString()));
        } else {
          emit(RegisterFailure(errMessage: 'Registration failed.'));
        }
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: 'error : ${e.toString()}'));
    }
  }

  Future<void> userLogin() async {
    try {
      emit(LoginLoading());
      final http.Response response = await apiService.post(url: signInApi, body: {
        'username': loginEmail.text,
        'password': loginPassword.text,
      });

      Map<String, dynamic> data = jsonDecode(response.body);

      if (data['status'] == 'false') {
        emit(LoginFailure(errMessage: 'هناك مشكلة'));
      } else {
        userModel = UserModel.fromJson(data);
        await saveUserToPreferences(userModel!); // Save user to SharedPreferences
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginFailure(errMessage: 'error : ${e.toString()}'));
      print('error : ${e.toString()}');
    }
  }

  Future<void> saveUserToPreferences(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert the UserModel to a JSON string
    String userJson = jsonEncode(user.toJson());

    // Save the JSON string in SharedPreferences
    await prefs.setString('user_model', userJson);
  }

  Future<UserModel?> getUserFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from SharedPreferences
    String? userJson = prefs.getString('user_model');

    if (userJson != null) {
      // Convert the JSON string back to a UserModel object
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }

    return null; // Return null if no user data found
  }
}
