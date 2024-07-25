import 'package:flutter/material.dart';
import 'package:my_manasa/features/profile/presentation/views/widgets/master_profile_widget.dart';
import 'package:my_manasa/features/profile/presentation/views/widgets/profile_card_widget.dart';
import 'package:my_manasa/features/profile/presentation/views/widgets/square_profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MasterProfileWidget(
                    title: 'Mohamed Ashraf',
                    icon: Icons.account_circle,
                    subTitle: 'المعلومات الشخصية',
                    onTap: () {
                    }),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareProfileCard(
                        title: 'تعليمات',
                        subTitle: 'تعليمات هامة لتحقيق اقصى استفادة',
                        icon: Icons.integration_instructions_rounded),
                    SquareProfileCard(
                        title: 'تحتاج مساعدة ؟',
                        subTitle: 'تواصل معنا لمزيد من المعلومات',
                        icon: Icons.question_mark_outlined)
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileCardWidget(
                    title: 'السياسة والخصوصية',
                    icon: Icons.policy_outlined,
                    ontap: () {
                    }),
                ProfileCardWidget(
                  ontap: (){},
                    title: 'عن التطبيق', icon: Icons.change_circle_rounded),
                ProfileCardWidget(
                    title: 'تسجيل الخروج',
                    icon: Icons.logout,
                    ontap: () {
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
