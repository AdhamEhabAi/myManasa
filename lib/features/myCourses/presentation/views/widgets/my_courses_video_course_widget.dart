import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';

class MyCoursesVideoCourseWidget extends StatelessWidget {
  const MyCoursesVideoCourseWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 65,
              child: Image.asset(
                'assets/images/NewVideo.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الدرس الاول',
                    style: Styles.bold16,
                  ),
                  Text(
                    'يحتوي هذة الكورس علي تأسيس كامل للصفوف و شرح وحل نماذج في الفيديو',
                    style: Styles.semiBold10,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
