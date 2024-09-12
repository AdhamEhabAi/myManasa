import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';

class ExamViewHeader extends StatelessWidget {
  const ExamViewHeader({
    super.key, required this.quizHomeworkModel,
  });
  final QuizHomeworkModel quizHomeworkModel;

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
            Text(quizHomeworkModel.name,style: Styles.semiBold12_95.copyWith(color: Colors.white),),
            const SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }
}
