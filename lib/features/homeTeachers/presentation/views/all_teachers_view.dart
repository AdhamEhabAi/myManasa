import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
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
      body: SizedBox(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns

          ),
          itemCount: 7, // Number of items in the grid
          itemBuilder: (context, index) {
            return AllTeachersTeacherWidget(
              onTap: () {
                Get.to(const TeacherView(), transition: Transition.fadeIn);

                // Handle tap
              },
            );
          },
        ),
      ),
    );
  }
}
