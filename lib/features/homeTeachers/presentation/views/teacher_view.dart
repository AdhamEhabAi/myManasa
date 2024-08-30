import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/course_view.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/teacher_course_widget.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/teacher_view_header.dart';

class TeacherView extends StatelessWidget {
  const TeacherView({super.key, required this.teacher});
  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: teacher.sec,
          backGroundColor: Colors.transparent,
          iconColor: AppColors.secondaryColor,
          titleColor: AppColors.secondaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: AppPadding.padding),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TeacherViewHeader(teacher: teacher,),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الكورسات',
                        style: Styles.semiBold20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return TeacherCourseWidget(
                          onTap: () {
                            Get.to(const CourseView(),
                                transition: Transition.fade);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
