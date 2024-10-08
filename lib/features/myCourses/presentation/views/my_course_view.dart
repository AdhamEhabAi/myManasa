import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_or_pdf_or_hm_or_quiz_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 58.0;
    final halfWidth = containerWidth / 2;
    final quarterWidth = containerWidth / 4;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: MediaQuery.of(context).size.height * .96,
            child: Column(
              children: [
                const MyCourseViewHeader(),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.name,
                        style: Styles.bold16,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        widget.course.title ?? 'يحتوي هذة الكورس علي تأسيس كامل للصفوف و شرح وحل نماذج في الفيديو',
                        style: Styles.semiBold14,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 11.h),
                  child: VideoOrPdfOrHmOrQuizWidget(
                    containerWidth: containerWidth,
                    halfWidth: halfWidth,
                    quarterWidth: quarterWidth,
                    selectedIndex: selectedIndex,
                    onCategorySelected: onCategorySelected,
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyCoursesVideoView(course: widget.course),
                      MyCoursesPdfView(courseId: widget.course.id),
                      MyCoursesHomeworkView(course: widget.course),
                      MyCoursesQuizView(course: widget.course),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
