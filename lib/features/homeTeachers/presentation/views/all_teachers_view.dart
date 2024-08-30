import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/manager/teacher_cubit.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/teacher_view.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/all_teachers_teacher_widget.dart';

class AllTeachersView extends StatelessWidget {
  const AllTeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المدرسين',
        backGroundColor: Colors.transparent,
        titleColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<TeacherCubit, TeacherState>(
        builder: (context, state) {
          if (state is TeacherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TeacherLoaded) {
            final List<Teacher> teachers = state.teachers;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

              ),
              itemCount: teachers.length, // Number of items in the grid
              itemBuilder: (context, index) {
                return AllTeachersTeacherWidget(
                  teacher: teachers[index],
                  onTap: () {
                    trans.Get.to(TeacherView(teacher: teachers[index],), transition: trans.Transition.fadeIn);
                  },
                );
              },
            );
          } else if (state is TeacherError) {
            return Center(child: Text(state.failure));
          } else {
            return const Center(child: Text('No Teachers Found'));
          }
        },
      ),
    );
  }
}
