import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/funtions.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_form_field.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/authentication/presentation/views/register_view.dart';
import 'package:my_manasa/features/home/presentation/views/main_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false; // Local state to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                trans.Get.offAll(() => const MainView(), transition: trans.Transition.fadeIn);
              }
            },
            builder: (context, state) {
              final authCubit = BlocProvider.of<AuthCubit>(context);
              return Form(
                key: authCubit.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/cloud.png',
                          width: 120.w,
                          height: 120.h,
                        ),
                        SizedBox(height: 10.h),
                        Image.asset(
                          'assets/images/flash.png',
                          width: 80.w,
                          height: 80.h,
                        ),
                        SizedBox(height: 10.h),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 150.w,
                          height: 100.h,
                        ),
                        Text(
                          'sky online',
                          style: Styles.bold20.copyWith(color: AppColors.primaryColor),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                    // Email TextFormField
                    CustomTextFormField(
                      controller: authCubit.loginEmail,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.primaryColor,
                      ),
                      labelText: 'البريد الالكتروني',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ادخل البريد الالكتروني';
                        } else {
                          return validateEmail(value);
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    // Password TextFormField
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isPasswordVisible,
                      controller: authCubit.loginPassword,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      labelText: 'كلمة المرور',
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمة المرور';
                        } else if (value.length < 6) {
                          return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // trans.Get.to(
                          //   const ForgetPasswordView(),
                          //   transition: trans.Transition.rightToLeft,
                          // );
                        },
                        child: Text(
                          'هل نسيت كلمة السر؟',
                          style: Styles.semiBold14.copyWith(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Login Button
                    if (state is LoginLoading)
                      const CircularProgressIndicator()
                    else
                      CustomButton(
                        borderRadius: 14.r,
                        text: Text(
                          'تسجيل الدخول',
                          style: Styles.semiBold20.copyWith(color: Colors.white),
                        ),
                        onPressed: () {
                          if (authCubit.loginFormKey.currentState!.validate()) {
                            authCubit.userLogin();
                          }
                        },
                      ),
                    SizedBox(height: 20.h),
                    // Register Button
                    TextButton(
                      onPressed: () {
                        trans.Get.to(
                          const RegisterView(),
                          transition: trans.Transition.rightToLeft,
                        );
                      },
                      child: Text(
                        'انشاء حساب جديد',
                        style: Styles.semiBold14.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
