import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';

class TeacherSubjectWidget extends StatelessWidget {
  const TeacherSubjectWidget({
    super.key,
    required this.onTap,
    required this.teacher,
  });

  final Teacher teacher;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFf4d4d4),
          borderRadius: BorderRadius.circular(32.r),  // Use .r for responsive radius
        ),
        width: double.infinity,  // Make it take the full width
        child: Row(
          children: [
            // Use CachedNetworkImage to load the teacher's image
            ClipRRect(
              borderRadius: BorderRadius.circular(32.r),  // Use .r for responsive radius
              child: CachedNetworkImage(
                imageUrl: APIEndpoints.imgPath + teacher.img,
                fit: BoxFit.cover,
                width: 64.w,  // Responsive width
                height: 64.h, // Responsive height
                placeholder: (context, url) => Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: 64.w,  // Responsive width
                  height: 64.h, // Responsive height
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: 64.w,  // Responsive width
                  height: 64.h, // Responsive height
                ),
              ),
            ),
            SizedBox(width: 10.w),  // Responsive width
            Expanded(
              child: Text(
                '${teacher.fname} ${teacher.lname}',
                style: Styles.semiBold16,
                maxLines: 1,  // Limit to one line for better appearance
                overflow: TextOverflow.ellipsis,  // Ellipsis if overflowed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
