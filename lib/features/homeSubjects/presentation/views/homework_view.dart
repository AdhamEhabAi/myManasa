import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/managers/homework_cubit/home_work_cubit.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_work_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';


class HomeworkView extends StatelessWidget {
  const HomeworkView({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeWorkCubit>(context).fetchHomeWorks(courseModel.id);
    return BlocBuilder<HomeWorkCubit, HomeWorkState>(
      builder: (context, state) {
        if (state is HomeWorkLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeWorkLoaded) {
          return ListView.separated(
            itemCount: state.homeWorks.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            itemBuilder: (context, index) {
              return HomeWorkWidget(
                onTap: () {},
                quizHomeworkModel: state.homeWorks[index],
              );
            },
          );
        } else if (state is HomeWorkError) {
          return Center(child: Text(state.message,style: Styles.semiBold20,));
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}
