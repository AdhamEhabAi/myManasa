import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/dialogs/get_code_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/homework_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/pdf_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/quiz_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/video_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_or_pdf_or_hm_or_quiz_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/course_view_header.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/manager/teacher_cubit.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key, required this.course});
  final CourseModel course;

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late final PageController pageController;
  late final TextEditingController codeController;
  int selectedIndex = 0;
  bool isOwned = false; // Track ownership status

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    codeController = TextEditingController();

    // Check if the course is owned by the student
    final userID = context.read<AuthCubit>().userModel!.id;
    context.read<TeacherCubit>().checkCourseOwnership(courseID: widget.course.id, userID: userID);
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
    // Reset course ownership status when leaving the page
    context.read<TeacherCubit>().resetCourseOwnership();

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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 11.0),
                  child: VideoOrPdfOrHmOrQuizWidget(
                    containerWidth: containerWidth,
                    halfWidth: halfWidth,
                    quarterWidth: quarterWidth,
                    selectedIndex: selectedIndex, // Pass selectedIndex
                    onCategorySelected: onCategorySelected, // Handle selection
                  ),
                ),
                BlocBuilder<TeacherCubit, TeacherState>(
                  builder: (context, state) {
                    if (state is CheckOwnershipLoaded) {
                      isOwned = state.isOwned;
                      return Expanded(
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: pageController,
                          children: [
                            VideoView(courseModel: widget.course, isOwned: isOwned),
                            PdfView(courseModel: widget.course),
                            HomeworkView(courseModel: widget.course),
                            QuizView(courseModel: widget.course),
                          ],
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                BlocBuilder<TeacherCubit, TeacherState>(
                  builder: (context, state) {
                    if (state is CheckOwnershipLoaded && !state.isOwned) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
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
                      );
                    }
                    return SizedBox.shrink(); // Return an empty widget if course is owned
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
