import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // Import ScreenUtil for responsive design

class CourseShimmer extends StatelessWidget {
  const CourseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.w),  // Use ScreenUtil for responsive padding
      child: SizedBox(
        height: 250.h,  // Make height responsive
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          period: const Duration(milliseconds: 1000),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100.h,  // Make height responsive
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270.w,  // Make width responsive
                      height: 150.h,  // Make height responsive
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),  // Make radius responsive
                      ),
                    ),
                    SizedBox(height: 10.h),  // Make height responsive
                    Center(
                      child: Container(
                        width: 200.w,  // Make width responsive
                        height: 30.h,  // Make height responsive
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),  // Make radius responsive
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),  // Make height responsive
                    Row(
                      children: [
                        Flexible(  // Add Flexible here to avoid overflow
                          child: Container(
                            width: 180.w,  // Make width responsive
                            height: 30.h,  // Make height responsive
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),  // Make radius responsive
                            ),
                          ),
                        ),
                        SizedBox(width: 30.w),  // Make width responsive
                        Container(
                          width: 50.w,  // Make width responsive
                          height: 30.h,  // Make height responsive
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),  // Make radius responsive
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20.w),  // Make width responsive
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
