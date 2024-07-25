import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/MycourseWidget.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'دوراتي',
            style: Styles.bold24.copyWith(color: AppColors.primaryColor),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const MyCourseWidget();
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}

