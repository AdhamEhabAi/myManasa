import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/dialogs/get_code_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/features/homeSubjects/presentation/manager/subject_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/pdf_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/video_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_or_pdf_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/course_view_header.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key, required this.course});
  final CourseModel course;

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late final PageController pageController;
  late final TextEditingController codeController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
    codeController = TextEditingController();
  }

  @override
  void dispose() {
    pageController.dispose();
    codeController.dispose();
    super.dispose();
  }

  void resetState() {
    // Reset pageController to initial page
    pageController.jumpToPage(1);
    // Reset the text field controller
    codeController.clear();
    // Reset the SubjectCubit state
    context.read<SubjectCubit>().resetState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth - 58.0;
    final halfWidth = containerWidth / 2;

    // Call resetState whenever this widget is rebuilt or comes into view
    WidgetsBinding.instance.addPostFrameCallback((_) {
      resetState();
    });

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            height: MediaQuery.of(context).size.height * .96,
            child: Column(
              children: [
                CourseViewHeader(course: widget.course),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/smallplay.png', color: AppColors.primaryColor),
                            Text('35 فيديو', style: Styles.semiBold16),
                            Image.asset('assets/images/small timer.png', color: AppColors.secondaryColor),
                            Text('3ساعات', style: Styles.semiBold16),
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
                      padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 11.0),
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
                    children: [
                      VideoView(courseModel: widget.course),
                      PdfView(courseModel: widget.course,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: CustomButton(
                    text: Text('شراء', style: Styles.semiBold24.copyWith(color: Colors.white)),
                    borderRadius: 26,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return GetCodeDialog(textEditingController: codeController);
                        },
                      );
                    },
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


