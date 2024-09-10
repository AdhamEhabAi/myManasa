import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/utils/styles.dart';

import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_or_pdf_or_hm_or_quiz_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/myCourses/presentation/manager/my_courses_cubit.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_homework_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_pdf_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_quiz_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_video_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_course_view_header.dart';

class MyCourseView extends StatefulWidget {
  const MyCourseView({super.key, required this.course});
  final CourseModel course;

  @override
  State<MyCourseView> createState() => _MyCourseViewState();
}

class _MyCourseViewState extends State<MyCourseView> {
  late final PageController pageController;
  late final TextEditingController codeController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    codeController = TextEditingController();
  }

  void resetState() {
    pageController.jumpToPage(0);
    codeController.clear();
  }

  void onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 58.0;
    final halfWidth = containerWidth / 2;
    final quarterWidth = containerWidth / 4;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyCourseViewHeader(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.name,
                    style: Styles.bold16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'يحتوي هذة الكورس علي تأسيس كامل للصفوف و شرح وحل نماذج في الفيديو',
                    style: Styles.semiBold14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/smallplay.png'),
                        Text(
                          '35 فيديو',
                          style: Styles.semiBold16,
                        ),
                        Image.asset('assets/images/small timer.png'),
                        Text(
                          '3ساعات',
                          style: Styles.semiBold16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 29.0, vertical: 11.0),
              child: VideoOrPdfOrHmOrQuizWidget(
                containerWidth: containerWidth,
                halfWidth: halfWidth,
                quarterWidth: quarterWidth,
                selectedIndex: selectedIndex, // Pass selectedIndex
                onCategorySelected: onCategorySelected, // Handle selection
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  context.read<MyCoursesCubit>().onPageChanged(index);
                },
                scrollDirection: Axis.horizontal,
                children: [
                  MyCoursesVideoView(
                    courseId: widget.course.id,
                  ),
                  MyCoursesPdfView(
                    courseId: widget.course.id,
                  ),
                  MyCoursesHomeworkView(
                    course: widget.course,
                  ),
                  MyCoursesQuizView(
                    course: widget.course,
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
