import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
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
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/WhatsApp Image 2024-04-30 at 00.30 2.png'),
                      radius: 50,
                    ),
                    Positioned(
                      bottom: 6,
                      right: -6,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 14,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.padding),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
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
                              'تغير',
                              style: Styles.semiBold20.copyWith(color: Colors.white),
                            ),
                            onPressed: () {
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
