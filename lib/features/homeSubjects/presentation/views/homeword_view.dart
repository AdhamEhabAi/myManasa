import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class HomeworkView extends StatelessWidget {
  const HomeworkView({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Homework View Content', style: Styles.bold22),
    );
  }
}
