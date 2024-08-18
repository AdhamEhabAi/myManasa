import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/dialogs/change_done_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/drop_down_textfield.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({super.key});

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {
  String? selectedGrade;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: '',
          backGroundColor: Colors.transparent,
          iconColor: AppColors.primaryColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage('assets/images/WhatsApp Image 2024-04-30 at 00.30 2.png'),
                      radius: 50.r, // Responsive radius
                    ),
                    Positioned(
                      bottom: 6.h, // Responsive positioning
                      right: -6.w, // Responsive positioning
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 14.r, // Responsive radius
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14.sp, // Responsive icon size
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.padding.r), // Responsive padding
                  child: SizedBox(
                    height: 0.8.sh, // Responsive height
                    width: 1.sw, // Responsive width
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomTextField(
                            borderColor: AppColors.primaryColor,
                            labelText: 'الأسم الأول',
                          ),
                          const CustomTextField(
                            borderColor: AppColors.primaryColor,
                            labelText: 'الأسم الثاني',
                          ),
                          CustomTextField(
                            borderColor: AppColors.primaryColor,
                            prefix: Icon(
                              Icons.phone,
                              color: AppColors.primaryColor,
                              size: 20.sp, // Responsive icon size
                            ),
                            labelText: 'رقم الموبيل',
                          ),
                          CustomTextField(
                            borderColor: AppColors.primaryColor,
                            prefix: Icon(
                              Icons.phone,
                              color: AppColors.primaryColor,
                              size: 20.sp, // Responsive icon size
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
                              'الصف الرابع',
                              'الصف الخامس'
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGrade = newValue;
                              });
                            },
                          ),
                          CustomTextField(
                            borderColor: AppColors.primaryColor,
                            prefix: Icon(
                              Icons.email,
                              color: AppColors.primaryColor,
                              size: 20.sp, // Responsive icon size
                            ),
                            labelText: 'البريد الاكتروني',
                          ),
                          CustomTextField(
                            borderColor: AppColors.primaryColor,
                            prefix: Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                              size: 20.sp, // Responsive icon size
                            ),
                            suffix: Icon(
                              Icons.visibility_off,
                              color: AppColors.primaryColor,
                              size: 20.sp, // Responsive icon size
                            ),
                            labelText: 'كلمة المرور',
                          ),
                          CustomButton(
                            borderRadius: 14.r, // Responsive border radius
                            text: Text(
                              'تغير',
                              style: Styles.semiBold20.copyWith(
                                color: Colors.white,
                                fontSize: 18.sp, // Responsive font size
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const ChangeDoneDialog(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
