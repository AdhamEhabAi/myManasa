import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/login_background.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginBackGround(),
          Positioned(
            top: 40,
              right: 20,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/images/back.png',
                    ),
                    size: 34,
                    color: Colors.white,
                  ))),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            right: 0,
            left: 0,
            bottom: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.padding),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/logo.png'),
                        Text(
                          'West online Academy',
                          style: Styles.semiBold14
                              .copyWith(color: AppColors.primaryColor),
                        )
                      ],
                    ),
                    const CustomTextField(
                      borderColor: AppColors.primaryColor,
                      prefix: Icon(
                        Icons.email,
                        color: AppColors.primaryColor,
                      ),
                      labelText: 'البريد الاكتروني',
                    ),
                    const CustomTextField(
                      borderColor: AppColors.primaryColor,
                      prefix: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      suffix: Icon(
                        Icons.visibility_off,
                        color: AppColors.primaryColor,
                      ),
                      labelText: 'كلمة المرور',
                    ),
                    Row(
                      children: [
                        Text(
                          'هل نسيت كلمة السر؟',
                          style: Styles.semiBold14.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    CustomButton(
                        borderRadius: 14,
                        text: Text(
                          'تسجيل الدخول',
                          style: Styles.semiBold20.copyWith(color: Colors.white),
                        ),
                        onPressed: () {}),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'انشاء حساب جديد',
                          style: Styles.semiBold14.copyWith(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
