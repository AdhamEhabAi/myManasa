import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/manager/teacher_cubit.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/teacher_view.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/all_teachers_teacher_widget.dart';

class AllTeachersView extends StatelessWidget {
  const AllTeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<TeacherCubit>(context);

    if (provider.teachersList.isEmpty) {
      provider.fetchAllTeachers();
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المدرسين',
        backGroundColor: Colors.transparent,
        titleColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<TeacherCubit, TeacherState>(
        builder: (context, state) {
          TeacherCubit provider = BlocProvider.of<TeacherCubit>(context);

          if (state is TeacherLoading && provider.teachersList.isEmpty) {
            // Show loading only if we are fetching for the first time
            return const Center(child: CircularProgressIndicator());
          } else if (state is TeacherError) {
            // Show error message if there is a failure
            return Center(child: Text(state.failure));
          } else if (provider.teachersList.isNotEmpty) {
            // Use the teachersList from the cubit directly
            final List<Teacher> teachers = provider.teachersList;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                return AllTeachersTeacherWidget(
                  teacher: teachers[index],
                  onTap: () {
                    trans.Get.to(
                          () => TeacherView(teacher: teachers[index]),
                      transition: trans.Transition.fadeIn,
                    );
                  },
                );
              },
            );
          } else {
            // Handle the case when there are no teachers
            return Center(
              child: Text(
                'No Teachers Found',
                style: Styles.bold20,
              ),
            );
          }
        },
      ),
    );
  }
}
