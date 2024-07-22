import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/core/widgets/main_background.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const MainBackGround(),
            Positioned(
                top: 20,
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
                      color: AppColors.primaryColor,
                    ))),
            Padding(
              padding: const EdgeInsets.all(AppPadding.padding),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اكتب البريد الأكتروني صحيح حتي نتمكن من ارسال الكود علي البريد الأكتروني',
                      style: Styles.regular18.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 30,),
                    const CustomTextField(
                        labelText: 'البريد الاكتروني',
                        borderColor: AppColors.primaryColor),
                    const SizedBox(height: 80,),

                    CustomButton(
                      width: MediaQuery.of(context).size.width/2,
                        borderRadius: 14,
                        text: Text(
                          'إرسال الكود',
                          style: Styles.semiBold20.copyWith(color: Colors.white),
                        ),
                        onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
