import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_play_video_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_video_course_widget.dart';

class MyCoursesVideoView extends StatelessWidget {
  const MyCoursesVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return MyCoursesVideoCourseWidget(onTap: () {
            Get.to(const MyCoursesPlayVideoView(),transition: Transition.fade);
          }, title: 'Adham',);
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 4);
  }
}
