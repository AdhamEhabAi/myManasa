import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_form_field.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();

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
                    CustomTextFormField(
                      controller: passController,
                      suffixIcon: const Icon(Icons.visibility_off,color: AppColors.primaryColor,),
                      color: Colors.transparent,
                        labelText: 'كلمة المرور',
                    ),
                    const SizedBox(height: 30,),
                     CustomTextFormField(
                      controller: passController,
                         suffixIcon: Icon(Icons.visibility_off,color: AppColors.primaryColor,),

                        color: Colors.transparent,
                        labelText: 'تأكيد كلمة المرور',
                     ),
                    const SizedBox(height: 80,),

                    CustomButton(
                      width: MediaQuery.of(context).size.width/2,
                      borderRadius: 14,
                      text: Text(
                        'تأكيد',
                        style: Styles.semiBold20.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        Get.to(const LoginView(),transition: Transition.rightToLeft);

                      },
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
