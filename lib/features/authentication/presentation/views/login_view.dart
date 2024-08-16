import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/authentication/presentation/views/forget_password_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/register_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/login_background.dart';
import 'package:my_manasa/features/home/presentation/views/main_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          const LoginBackGround(),
          Positioned(
            top: 40.h,
            right: 20.w,
            child: IconButton(
              onPressed: () {
                trans.Get.back();
              },
              icon: ImageIcon(
                const AssetImage(
                  'assets/images/back.png',
                ),
                size: 34.h,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 3).h,
            right: 0.w,
            left: 0.w,
            bottom: 0.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.padding.w),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      trans.Get.showSnackbar(
                        trans.GetSnackBar(
                          duration: const Duration(seconds: 2),
                          messageText: Text(
                            state.errMessage,
                            style: Styles.semiBold14.copyWith(color: Colors.white),
                          ),
                        ),
                      );
                    } else if (state is LoginSuccess) {
                      trans.Get.offAll(() => const MainView(), transition: trans.Transition.fadeIn);
                    }
                  },
                  builder: (context, state) {
                    final authCubit = BlocProvider.of<AuthCubit>(context);
                    return Form(
                      key: authCubit.loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 150.w,
                                height: 150.h,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'West online Academy',
                                style: Styles.semiBold14.copyWith(color: AppColors.primaryColor),
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                          CustomTextField(
                            controller: authCubit.loginEmail,
                            borderColor: AppColors.primaryColor,
                            prefix: const Icon(
                              Icons.email,
                              color: AppColors.primaryColor,
                            ),
                            labelText: 'البريد الاكتروني',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال البريد الإلكتروني';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'يرجى إدخال بريد إلكتروني صالح';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: authCubit.loginPassword,
                            borderColor: AppColors.primaryColor,
                            prefix: const Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                            ),
                            suffix: const Icon(
                              Icons.visibility_off,
                              color: AppColors.primaryColor,
                            ),
                            labelText: 'كلمة المرور',
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
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  trans.Get.to(
                                    const ForgetPasswordView(),
                                    transition: trans.Transition.rightToLeft,
                                  );
                                },
                                child: Text(
                                  'هل نسيت كلمة السر؟',
                                  style: Styles.semiBold14.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
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
                          SizedBox(height: 10.h),
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
          ),
        ],
      ),
    );
  }
}
