import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class ExamViewHeader extends StatelessWidget {
  const ExamViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('أختبار للغة العربية علي الفصل الاول',style: Styles.semiBold12_95.copyWith(color: Colors.white),),
            const SizedBox(height: 15,),
            Row(
              children: [
                Text(
                  'مع مستر / نبيل وليم',
                  style: Styles.semiBold12_95.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 12,
                  child: Image.asset(
                    'assets/images/smallTeacher.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('مدة الاختبار: 24:10',style: Styles.semiBold12_95.copyWith(color: Colors.white),),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
