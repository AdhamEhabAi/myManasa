import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/utils/styles.dart';

import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/course_view_header.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_or_pdf_widget.dart';
import 'package:my_manasa/features/myCourses/presentation/manager/my_courses_cubit.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_pdf_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_video_view.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 58.0;
    final halfWidth = containerWidth / 2;
    final PageController pageController = PageController(initialPage: 1);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CourseViewHeader(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'كورس كامل عن القراءة',
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
            BlocBuilder<MyCoursesCubit, MyCoursesState>(
              builder: (context, state) {
                bool isSelected = (state is CourseVideoPdfChanged)
                    ? state.isVideo
                    : context.read<MyCoursesCubit>().isVideo;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 29.0, vertical: 11.0),
                  child: VideoOrPdfWidget(
                    containerWidth: containerWidth,
                    isSelected: isSelected,
                    halfWidth: halfWidth,
                    onSwitch: (bool isSelected) {
                      pageController.animateToPage(
                        isSelected ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      context.read<MyCoursesCubit>().switchComplete();
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  context.read<MyCoursesCubit>().onPageChanged(index);
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  MyCoursesVideoView(),
                  MyCoursesPdfView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
