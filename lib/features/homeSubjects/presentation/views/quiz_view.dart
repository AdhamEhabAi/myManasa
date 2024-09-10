import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/Quiz/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:my_manasa/features/Quiz/presentation/views/widgets/subject_quiz_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class QuizView extends StatelessWidget {
  final CourseModel courseModel;

  const QuizView({super.key, required this.courseModel});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuizCubit>(context).fetchQuizzes(courseId: courseModel.id);
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is QuizLoaded) {
          return ListView.separated(
            itemCount: state.quizzes.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            itemBuilder: (context, index) {
              final quiz = state.quizzes[index];
              return SubjectQuizWidget(
                quizHomeworkModel: quiz,
                onTap: () {},
              );
            },
          );
        } else if (state is QuizError) {
          return Center(child: Text(state.message,style: Styles.semiBold20,));
        }
        return SizedBox.shrink();
      },
    );
  }
}
