import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'الأختبارات',
          style: Styles.semiBold36.copyWith(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/no_quizes_image.png', width: MediaQuery.of(context).size.width / 2,),
              const SizedBox(height: 20,),
              Text(
                'لا يوجد اختبارات لمواد اشتركت فيها,في الوقت الحالي',
                style: Styles.semiBold16.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
