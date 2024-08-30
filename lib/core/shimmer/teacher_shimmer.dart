import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil for responsive design

class TeacherShimmer extends StatelessWidget {
  const TeacherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 16.0.h), // Make padding responsive
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1000),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 260.w, // Make width responsive
              margin: EdgeInsets.symmetric(vertical: 8.0.h), // Make margin responsive
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17.r), // Make radius responsive
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 1.h), // Make offset responsive
                    blurRadius: 2.r, // Make blur radius responsive
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Placeholder
                  Container(
                    height: 120.h, // Make height responsive
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17.r),
                        topRight: Radius.circular(17.r),
                      ),
                    ),
                  ),
                  // Text Placeholder
                  Expanded(  // Use Expanded to avoid overflow
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h), // Make padding responsive
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Wrapping text placeholders with Flexible
                          Flexible(
                            child: Container(
                              width: 120.w, // Make width responsive
                              height: 15.h, // Make height responsive
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r), // Make radius responsive
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h), // Make spacing responsive
                          Flexible(
                            child: Container(
                              width: 80.w, // Make width responsive
                              height: 15.h, // Make height responsive
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r), // Make radius responsive
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h), // Make spacing responsive
                          Flexible(
                            child: Container(
                              width: 60.w, // Make width responsive
                              height: 15.h, // Make height responsive
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r), // Make radius responsive
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 12.w), // Make spacing responsive
          itemCount: 3, // Number of shimmer items to display
        ),
      ),
    );
  }
}
