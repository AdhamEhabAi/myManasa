import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/shimmer/courses_shimmer.dart';
import 'package:my_manasa/features/homeTeachers/presentation/manager/teacher_cubit.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/all_teachers_view.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/teacher_view.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/all_widget.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/home_single_teacher_widget.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/teachers_dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTeachersWidget extends StatefulWidget {
  const HomeTeachersWidget({super.key});

  @override
  State<HomeTeachersWidget> createState() => _HomeTeachersWidgetState();
}

class _HomeTeachersWidgetState extends State<HomeTeachersWidget> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });

    final provider = BlocProvider.of<TeacherCubit>(context);
    if (provider.teachersList.isEmpty) {
      provider.fetchAllTeachers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h), // Adapted padding
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w), // Adapted padding
            child: AllWidget(
              onTap: () {
                trans.Get.to(() => const AllTeachersView(), // Changed to use function
                    transition: trans.Transition.downToUp);
              },
              text: 'أشهر المدرسين',
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: AppPadding.padding.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.3,
              child: BlocBuilder<TeacherCubit, TeacherState>(
                builder: (context, state) {
                  TeacherCubit provider = BlocProvider.of<TeacherCubit>(context);

                  if (state is TeacherLoading && provider.teachersList.isEmpty) {
                    return const CoursesShimmer(); // Use shimmer only if list is empty
                  } else if (provider.teachersList.isNotEmpty) { // Use teachersList directly
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      itemCount: provider.teachersList.length.clamp(0, 3),
                      itemBuilder: (context, index) => HomeSingleTeacherWidget(
                        teacher: provider.teachersList[index],
                        onTap: () {
                          trans.Get.to(() => TeacherView(teacher: provider.teachersList[index]), // Use function
                              transition: trans.Transition.fadeIn);
                        },
                      ),
                    );
                  } else if (state is TeacherError) {
                    return Center(child: Text(state.failure));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20.h), // Adapted height
          TeachersDotsIndicator(currentPage: _currentPage),
        ],
      ),
    );
  }
}
