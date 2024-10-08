import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';

class SubjectQuizWidget extends StatelessWidget {
  const SubjectQuizWidget({super.key, required this.onTap, required this.quizHomeworkModel});
  final VoidCallback onTap;
  final QuizHomeworkModel quizHomeworkModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4.5,
                height: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Image.asset(
                  'assets/images/QuizDone.png',
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Text(
                  quizHomeworkModel.name,
                  style: Styles.bold14.copyWith(color: AppColors.primaryColor),
                ),
              ),
              Text(
                quizHomeworkModel.formattedDate,
                style: Styles.regular12.copyWith(color: Colors.grey),
              ),
              SizedBox(width: 20.w,),
            ],
          ),
        ),
      ),
    );
  }
}
