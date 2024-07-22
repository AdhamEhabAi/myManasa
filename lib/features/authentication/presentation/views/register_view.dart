import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/drop_down_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? selectedCountry;

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
            Positioned(
              top: MediaQuery.of(context).size.height*.10,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.padding),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'إنشاء حساب',
                              style: Styles.semiBold30,
                            ),
                            const CustomTextField(
                              borderColor: AppColors.primaryColor,
                              labelText: 'الأسم الأول',
                            ),
                            const CustomTextField(
                              borderColor: AppColors.primaryColor,
                              labelText: 'الأسم الثاني',
                            ),
                            const CustomTextField(
                              borderColor: AppColors.primaryColor,
                              prefix: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                              ),
                              labelText: 'رقم الموبيل',
                            ),
                            const CustomTextField(
                              borderColor: AppColors.primaryColor,
                              prefix: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                              ),
                              labelText: 'رقم الموبيل ولي الامر',
                            ),
                            CustomDropdownField(
                              hintText: 'اختار الصف',
                              labelText: 'الصف',
                              items: const [
                                'الصف الاول',
                                'الصف الاول',
                                'الصف الاول',
                                'الصف الاول',
                                'الصف الاول'
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCountry = newValue;
                                });
                              },
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
                            CustomButton(
                                borderRadius: 14,
                                text: Text(
                                  'إنشاء حساب',
                                  style: Styles.semiBold20
                                      .copyWith(color: Colors.white),
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
