import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSingleTeacherWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Teacher teacher;

  const HomeSingleTeacherWidget({
    super.key,
    required this.onTap,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppPadding.padding.w,
        right: 10.w,
        top: 10.h,
        bottom: 10.h,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4.r, // Match blur radius
                spreadRadius: 0.r, // Match spread radius
              ),
            ],
            borderRadius: BorderRadius.circular(17.r),
            color: Colors.grey, // Added background color for consistency
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17.r),
                    topRight: Radius.circular(17.r),
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 50),

                    imageUrl: APIEndpoints.imgPath + teacher.img,
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
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 4.r, // Match blur radius
                      spreadRadius: 0.r, // Match spread radius
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(17.r),
                    bottomLeft: Radius.circular(17.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'مستر /',
                                style: Styles.semiBold16.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                '${teacher.fname} ${teacher.lname}',
                                style: Styles.semiBold16.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'أستاذ ${teacher.sec}',
                            style: Styles.semiBold12_95.copyWith(
                              color: Colors.grey,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
