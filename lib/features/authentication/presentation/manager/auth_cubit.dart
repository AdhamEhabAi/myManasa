import 'dart:convert';
import 'dart:math';
import 'dart:developer' as l;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:my_manasa/features/authentication/data/models/user_model.dart';
import 'package:my_manasa/features/authentication/presentation/views/change_password_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/email_code_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';
import 'package:my_manasa/features/authentication/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

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
  String? selectedCountry;

  String getValueOfSelectedCountry() {
    switch (selectedCountry) {
      case 'الصف الاول الثانوي':
        return '1';
      case 'الصف الثاني الثانوي':
        return '2';
      case 'الصف الثالث الثانوي':
        return '3';
      default:
        throw Exception('Invalid country selected');
    }
  }


  void verifyPhoneNumber(String phoneNumber) {
    if (numbers.contains(phoneNumber)) {
      generatedOTP = '123456';
      emit(PhoneNumberFound());
      trans.Get.to(const EmailCodeView());
    } else {
      generatedOTP = generateOTP();
      print(generatedOTP);
      emit(PhoneNumberNotFound());
      trans.Get.to(const EmailCodeView());
    }
  }

  void verifyOTP(String otp) {
    if (otp == generatedOTP) {
      emit(PhoneNumberOTPValid());
      trans.Get.to(const ChangePasswordView());
    } else {
      emit(PhoneNumberOTPNOTValid());
      ToastM.show('الكود خطأ');
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
      final result = await authRepo.userRegister(
        fname: fName.text,
        lname: lName.text,
        fnum: fPhone.text,
        lnum: lPhone.text,
        username: email.text,
        password: password.text,
        userClass: getValueOfSelectedCountry(),
        country: '1',
      );

      result.fold(
            (failure) {
          emit(RegisterFailure(errMessage: failure));
          ToastM.show(failure);
        },
            (message) {
          emit(RegisterSuccess());
          ToastM.show('تم انشاء الحساب بنجاح');
          trans.Get.to(const LoginView(), transition: trans.Transition.fadeIn);
        },
      );
    } catch (e) {
      emit(RegisterFailure(errMessage: 'error : ${e.toString()}'));
    }
  }

  Future<void> userLogin() async {
    try {
      emit(LoginLoading());
      final result = await authRepo.userLogin(
        username: loginEmail.text,
        password: loginPassword.text,
      );

      result.fold(
            (failure) {
          emit(LoginFailure(errMessage: failure));
          ToastM.show(failure);
        },
            (user) async {
              l.log(user.toString());
          userModel = user;
          await saveUserToPreferences(userModel!);
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      emit(LoginFailure(errMessage: 'error : ${e.toString()}'));
    }
  }

  Future<void> saveUserToPreferences(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user_model', userJson);
  }

  Future<UserModel?> getUserFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_model');

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }

    return null;
  }

  @override
  Future<void> close() {
    fName.dispose();
    lName.dispose();
    fPhone.dispose();
    lPhone.dispose();
    email.dispose();
    password.dispose();
    loginEmail.dispose();
    loginPassword.dispose();
    return super.close();
  }
}
