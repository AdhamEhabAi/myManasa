import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyCourseWidget extends StatelessWidget {
  const MyCourseWidget({super.key, required this.onTap, required this.course});
  final VoidCallback onTap;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4.5,
                    height: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(  // Wrap the Column with Expanded
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: Text(
                            course.name,
                            style: Styles.bold16.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0.w, top: 8.0.h),
                          child: Text(
                            course.sub,
                            style: Styles.semiBold14.copyWith(color: Colors.grey),
                          ),
                        ),
                        // Uncomment the LinearPercentIndicator if needed
                        // LinearPercentIndicator(
                        //   width: 180.0.w,
                        //   lineHeight: 8.0.h,
                        //   trailing: Text(
                        //     '20/30',
                        //     style: TextStyle(color: Colors.grey.shade700),
                        //   ),
                        //   percent: 0.7,
                        //   backgroundColor: Colors.grey,
                        //   progressColor: AppColors.primaryColor,
                        //   barRadius: Radius.circular(12.r),
                        //   isRTL: true,
                        // ),
                      ],
                    ),
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
