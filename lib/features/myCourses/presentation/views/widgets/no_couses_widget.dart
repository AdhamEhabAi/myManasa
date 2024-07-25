import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class NoCoursesWidget extends StatelessWidget {
  const NoCoursesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
