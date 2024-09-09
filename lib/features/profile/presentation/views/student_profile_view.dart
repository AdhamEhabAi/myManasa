import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/dialogs/change_done_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_text_form_field.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:my_manasa/features/authentication/data/models/user_model.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/profile/presentation/manager/profile_cubit.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/drop_down_textfield.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({super.key});

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String? _selectedYear; // New field for year selection

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  // Function to map year selection to API values
  String? getYearValue() {
    switch (_selectedYear) {
      case 'الصف الاول الثانوي':
        return '1';
      case 'الصف الثاني الثانوي':
        return '2';
      case 'الصف الثالث الثانوي':
        return '3';
      default:
        return null; // Return null if no valid selection is made
    }
  }

  // Validate form fields when the button is pressed
  bool validateForm() {
    if (_currentPasswordController.text.isEmpty) {
      ToastM.show('كلمة المرور الحالية مطلوبة');
      return false;
    }
    if (_newPasswordController.text.isNotEmpty &&
        _newPasswordController.text != _confirmPasswordController.text) {
      ToastM.show('كلمة المرور الجديدة وتأكيد كلمة المرور غير متطابقتين');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = BlocProvider.of<AuthCubit>(context).userModel!;
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
                Padding(
                  padding: EdgeInsets.all(
                      AppPadding.padding.r), // Responsive padding
                  child: SizedBox(
                    height: 0.8.sh, // Responsive height
                    width: 1.sw, // Responsive width
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: _firstNameController,
                            labelText: 'الاسم الأول',
                          ),
                          CustomTextFormField(
                            controller: _lastNameController,
                            labelText: 'الاسم الثاني',
                          ),
                          CustomDropdownField(
                            hintText: 'اختار السنة الدراسية',
                            labelText: 'السنة الدراسية',
                            items: const [
                              'الصف الاول الثانوي',
                              'الصف الثاني الثانوي',
                              'الصف الثالث الثانوي',
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedYear = newValue;
                              });
                            },
                          ),
                          CustomTextFormField(
                            controller: _currentPasswordController,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                            labelText: 'كلمة المرور الحالية',
                            obscureText: true,
                          ),
                          CustomTextFormField(
                            controller: _newPasswordController,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                            labelText: 'كلمة المرور الجديدة',
                            obscureText: true,
                          ),
                          CustomTextFormField(
                            controller: _confirmPasswordController,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                            labelText: 'تأكيد كلمة المرور الجديدة',
                            obscureText: true,
                          ),
                          BlocConsumer<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              if (state is ProfileUpdated) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const ChangeDoneDialog(),
                                );
                              } else if (state is ProfileUpdateFailed) {
                                ToastM.show(state.message);
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                borderRadius: 14.r, // Responsive border radius
                                text: Text(
                                  'تغير',
                                  style: Styles.semiBold20.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.sp, // Responsive font size
                                  ),
                                ),
                                onPressed: () {
                                  if (validateForm()) {
                                    final yearValue =
                                        getYearValue(); // Get the mapped value for the year
                                    context.read<ProfileCubit>().updateProfile(
                                          userId: user.id,
                                          currentPassword:
                                              _currentPasswordController.text,
                                          year: yearValue ?? user.yr,
                                          lastName:
                                              _lastNameController.text.isEmpty
                                                  ? user.lname
                                                  : _lastNameController.text,
                                          firstName:
                                              _firstNameController.text.isEmpty
                                                  ? user.fname
                                                  : _firstNameController.text,
                                          newPassword:
                                              _newPasswordController.text,
                                          confirmPassword:
                                              _confirmPasswordController.text,
                                        );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
