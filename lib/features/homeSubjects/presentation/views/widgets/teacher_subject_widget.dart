import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class TeacherSubjectWidget extends StatelessWidget {
  const TeacherSubjectWidget({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        width: MediaQuery.of(context).size.width,
        child:  Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Teacher (2).png'),
              radius: 32,
            ),
            const SizedBox(width: 10,),
            Text('مستر /نبيل وليم',style: Styles.semiBold16,)
          ],
        ),
      ),
    );
  }
}
