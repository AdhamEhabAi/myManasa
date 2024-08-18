import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/custom_percent_indicator.dart';
import 'package:my_manasa/features/homeSubjects/presentation/manager/subject_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/pdf_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/video_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_or_pdf_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/course_view_header.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 58.0;
    final halfWidth = containerWidth / 2;
    final PageController pageController = PageController(initialPage: 1);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: MediaQuery.of(context).size.height * .96,
            child: Column(
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
                BlocBuilder<SubjectCubit, SubjectState>(
                  builder: (context, state) {
                    bool isSelected = (state is CourseVideoPdfChanged)
                        ? state.isVideo
                        : context.read<SubjectCubit>().isVideo;
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
                          context.read<SubjectCubit>().switchComplete();
                        },
                      ),
                    );
                  },
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      context.read<SubjectCubit>().onPageChanged(index);
                    },
                    scrollDirection: Axis.horizontal,
                    children: const [
                      VideoView(),
                      PdfView(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: CustomButton(
                      text: Text('شراء',
                          style:
                              Styles.semiBold24.copyWith(color: Colors.white)),
                      borderRadius: 26,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .8,
                                height: MediaQuery.of(context).size.height / 4,
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomPercentIndicator(
                                      lineRadius: 3,
                                      radius: 30,
                                        titleText: '',
                                        doneVideos: 15,
                                        totalVideos: 30,
                                        footerText: 'درجة',

                                        lineColor: Colors.greenAccent,),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
