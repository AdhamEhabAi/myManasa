import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/drop_down_textfield.dart';
import 'package:get/get.dart' as trans;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    AuthCubit provider = BlocProvider.of<AuthCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const MainBackGround(),
            Positioned(
              top: 20.h,
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
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .10.h,
              left: 0.w,
              right: 0.w,
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    height: MediaQuery.of(context).size.height * 0.80.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.padding.w),
                      child: Form(
                        key: provider.registerFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'إنشاء حساب',
                              style: Styles.semiBold30.copyWith(fontSize: 30.sp),
                            ),
                            CustomTextField(
                              controller: provider.fName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل الاسم الاول';
                                }
                                return null;
                              },
                              borderColor: AppColors.primaryColor,
                              labelText: 'الأسم الأول',
                            ),
                            CustomTextField(
                              controller: provider.lName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل الاسم الثاني';
                                }
                                return null;
                              },
                              borderColor: AppColors.primaryColor,
                              labelText: 'الأسم الثاني',
                            ),
                            CustomTextField(
                              controller: provider.fPhone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل رقم الموبيل';
                                }
                                return null;
                              },
                              borderColor: AppColors.primaryColor,
                              prefix: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              labelText: 'رقم الموبيل',
                            ),
                            CustomTextField(
                              controller: provider.lPhone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل رقم الموبيل ولي الامر';
                                }
                                return null;
                              },
                              borderColor: AppColors.primaryColor,
                              prefix: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              labelText: 'رقم الموبيل ولي الامر',
                            ),
                            CustomDropdownField(
                              hintText: 'اختار الصف',
                              labelText: 'الصف',
                              items: const [
                                'الصف الاول',
                                'الصف الثاني',
                                'الصف الثالث',
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCountry = newValue;
                                });
                              },
                            ),
                            CustomTextField(
                              controller: provider.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل البريد الاكتروني';
                                }
                                return null;
                              },
                              borderColor: AppColors.primaryColor,
                              prefix: Icon(
                                Icons.email,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              labelText: 'البريد الاكتروني',
                            ),
                            CustomTextField(
                              controller: provider.password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل كلمة المرور';
                                }
                                return null;
                              },
                              borderColor: AppColors.primaryColor,
                              prefix: Icon(
                                Icons.lock,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              suffix: Icon(
                                Icons.visibility_off,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              labelText: 'كلمة المرور',
                            ),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is RegisterFailure) {
                                  trans.Get.showSnackbar(trans.GetSnackBar(
                                    duration: const Duration(seconds: 2),
                                    messageText: Text(
                                      state.errMessage,
                                      style: Styles.semiBold14.copyWith(color: Colors.white),
                                    ),
                                  ));
                                }
                              },
                              builder: (context, state) {
                                if (state is RegisterLoading) {
                                  return const CircularProgressIndicator(); // Display a loading indicator while registering
                                }
                                return CustomButton(
                                  borderRadius: 14.r,
                                  text: Text(
                                    'إنشاء حساب',
                                    style: Styles.semiBold20
                                        .copyWith(color: Colors.white, fontSize: 20.sp),
                                  ),
                                  onPressed: () {
                                    if (provider.registerFormKey.currentState!
                                        .validate()) {
                                      provider.userRegister();
                                    }
                                  },
                                );
                              },
                            ),
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
