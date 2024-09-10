import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as t;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/shimmer/my_courses_shimmer.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/myCourses/presentation/manager/my_courses_cubit.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_course_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/MycourseWidget.dart';
import 'package:my_manasa/features/myCourses/repo/my_courses_repo.dart';
import 'package:my_manasa/core/utils/api_service.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = BlocProvider.of<AuthCubit>(context).userModel!.id;
    return BlocProvider(
      create: (context) => MyCoursesCubit(MyCoursesRepo(ApiService()))..fetchOwnedCourses(userId: userId),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'دوراتي',
              style: Styles.bold24.copyWith(color: AppColors.primaryColor),
            ),
          ),
          body: BlocBuilder<MyCoursesCubit, MyCoursesState>(
            builder: (context, state) {
              if (state is MyCoursesLoading) {
                // Show shimmer effect while loading
                return ListView.separated(
                  itemCount: 5, // Display 5 shimmer items as a placeholder
                  itemBuilder: (context, index) => const ShimmerLoadingWidget(),
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                );
              } else if (state is MyCoursesError) {
                return Center(child: Text(state.message,style: Styles.bold16,));
              } else if (state is MyCoursesLoaded) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final course = state.courses[index];
                      return MyCourseWidget(
                        course: course,
                        onTap: () {
                          t.Get.to(
                             MyCourseView(course: course,),
                            transition: t.Transition.fade,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 20),
                    itemCount: state.courses.length,
                  ),
                );
              } else {
                return const Center(child: Text('حدث خطأ غير متوقع.'));
              }
            },
          ),
        ),
      ),
    );
  }
}

