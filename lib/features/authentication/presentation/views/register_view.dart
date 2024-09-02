import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/funtions.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_form_field.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/drop_down_textfield.dart';
import 'package:get/get.dart' as trans;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isPasswordVisible = false; // Local state for password visibility

  @override
  Widget build(BuildContext context) {
    AuthCubit provider = BlocProvider.of<AuthCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
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
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .10.h,
                left: 0.w,
                right: 0.w,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    height: MediaQuery.of(context).size.height * 0.70.h,
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
                            CustomTextFormField(
                              controller: provider.fName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل الاسم الاول';
                                }
                                return null;
                              },
                              labelText: 'الأسم الأول',
                            ),
                            CustomTextFormField(
                              controller: provider.lName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل الاسم الثاني';
                                }
                                return null;
                              },
                              labelText: 'الأسم الثاني',
                            ),
                            CustomTextFormField(
                              controller: provider.fPhone,
                              validator: (value) {
                                RegExp regExp = RegExp(r'^(012|010|011|015)\d{8}$');
                                if (value == null || value.isEmpty) {
                                  return 'ادخل رقم الموبيل ولي الامر';
                                } else if (regExp.hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'ادخل رقم الهاتف صحيح';
                                }
                              },
                              prefixIcon: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              labelText: 'رقم الموبيل',
                            ),
                            CustomTextFormField(
                              controller: provider.lPhone,
                              validator: (value) {
                                RegExp regExp = RegExp(r'^(012|010|011|015)\d{8}$');
                                if (value == null || value.isEmpty) {
                                  return 'ادخل رقم الموبيل ولي الامر';
                                } else if (regExp.hasMatch(value)) {
                                  return null;
                                } else {
                                  return 'ادخل رقم الهاتف صحيح';
                                }
                              },
                              prefixIcon: Icon(
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
                                'الصف الاول الثانوي',
                                'الصف الثاني الثانوي',
                                'الصف الثالث الثانوي',
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  provider.selectedCountry = newValue;
                                });
                              },
                            ),
                            CustomTextFormField(
                              controller: provider.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل البريد الاكتروني';
                                } else {
                                  return validateEmail(value);
                                }
                              },
                              prefixIcon: Icon(
                                Icons.email,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              labelText: 'البريد الاكتروني',
                            ),
                            // Password TextFormField with toggle visibility
                            CustomTextFormField(
                              controller: provider.password,
                              obscureText: !_isPasswordVisible, // Use local state for visibility
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل كلمة المرور';
                                }
                                return null;
                              },
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.primaryColor,
                                size: 24.h,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                                  });
                                },
                                child: Icon(
                                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: AppColors.primaryColor,
                                  size: 24.h,
                                ),
                              ),
                              labelText: 'كلمة المرور',
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
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
                                    if (provider.registerFormKey.currentState!.validate()) {
                                      if (provider.selectedCountry == null) {
                                        ToastM.show('الرجاء اختيار الصف');
                                        return;
                                      }
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
            ],
          ),
        ),
      ),
    );
  }
}
