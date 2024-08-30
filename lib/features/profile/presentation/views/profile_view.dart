import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/dialogs/sign_out_dialog.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/profile/presentation/views/student_profile_view.dart';
import 'package:my_manasa/features/profile/presentation/views/widgets/master_profile_widget.dart';
import 'package:my_manasa/features/profile/presentation/views/widgets/profile_card_widget.dart';
import 'package:my_manasa/features/profile/presentation/views/widgets/square_profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MasterProfileWidget(
                    title:
                        '${authCubit.userModel!.fname} ${authCubit.userModel!.lname}',
                    icon: Icons.account_circle,
                    subTitle: 'المعلومات الشخصية',
                    onTap: () {
                      trans.Get.to(const StudentProfileView(),
                          transition: trans.Transition.downToUp);
                    }),
                SizedBox(
                  height: 40.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareProfileCard(
                      backGroundColor: AppColors.primaryColor,
                        title: 'تعليمات',
                        subTitle: 'تعليمات هامة لتحقيق اقصى استفادة',
                        icon: Icons.integration_instructions_rounded),
                    SquareProfileCard(
                      backGroundColor: AppColors.secondaryColor,
                        title: 'تحتاج مساعدة ؟',
                        subTitle: 'تواصل معنا لمزيد من المعلومات',
                        icon: Icons.question_mark_outlined)
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                ProfileCardWidget(
                    title: 'السياسة والخصوصية',
                    icon: Icons.policy_outlined,
                    ontap: () {}),
                ProfileCardWidget(
                    ontap: () {},
                    title: 'عن التطبيق',
                    icon: Icons.change_circle_rounded),
                ProfileCardWidget(
                    title: 'تسجيل الخروج',
                    icon: Icons.logout,
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const SignOutDialog(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
