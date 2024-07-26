import 'package:flutter/material.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_pdf_course_widget.dart';

class MyCoursesPdfView extends StatelessWidget {
  const MyCoursesPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const MyCoursesPdfCourseWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 4);
  }
}
