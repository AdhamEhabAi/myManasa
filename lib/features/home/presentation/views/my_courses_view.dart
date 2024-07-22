import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'دوراتي',
            style: Styles.semiBold36.copyWith(color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_course_image.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 20), // Add some space between image and text
                Text(
                  'لا يوجد دورات اشتركت فيها',
                  style: Styles.semiBold16.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
