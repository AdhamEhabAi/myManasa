import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import CachedNetworkImage
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';

class TeacherCourseWidget extends StatelessWidget {
  const TeacherCourseWidget({
    super.key,
    required this.onTap,
    required this.course,
  });

  final VoidCallback onTap;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding),
      child: InkWell(
        onTap: onTap,
        child: Container(
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
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Course Image with CachedNetworkImage and Clipping
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4.5,
                  height: 60.h,
                  child: CachedNetworkImage(
                    imageUrl: APIEndpoints.imgPath + course.img!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
               SizedBox(width: 10.w), // Add spacing between widgets

              // Course Info
              Expanded( // Use Expanded to prevent overflow
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: Styles.bold16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                    ),
                  ],
                ),
              ),
              // Course Icon
            ],
          ),
        ),
      ),
    );
  }
}
