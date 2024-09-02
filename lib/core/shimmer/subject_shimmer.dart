import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectShimmer extends StatelessWidget {
  const SubjectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              // Circular Image Placeholder
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10.w),

              // Content Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject Title Placeholder
                    Container(
                      width: 150.w,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 8.h),

                    // Subtitle or Name Placeholder
                    Container(
                      width: 100.w,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 8.h),

                    // Placeholder for circular indicators
                    Row(
                      children: [
                        for (int i = 0; i < 3; i++) ...[
                          Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                          ),
                          if (i < 2) SizedBox(width: 10.w), // Add spacing between circles
                        ]
                      ],
                    ),
                  ],
                ),
              ),

              // Right-side Image Placeholder
              Container(
                width: 60.w,
                height: 60.w,
                margin: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
