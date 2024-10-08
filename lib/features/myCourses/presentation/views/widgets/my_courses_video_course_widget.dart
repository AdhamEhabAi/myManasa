import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';

class MyCoursesVideoCourseWidget extends StatelessWidget {
  const MyCoursesVideoCourseWidget({super.key, required this.onTap, required this.title, required this.dis});
  final VoidCallback onTap;
  final String title;
  final String dis;
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
                'assets/images/video-marketing.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.bold16,
                  ),
                  Text(
                    dis == '' ?  'يحتوي هذة الكورس علي تأسيس كامل للصفوف و شرح وحل نماذج في الفيديو' : dis,
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
