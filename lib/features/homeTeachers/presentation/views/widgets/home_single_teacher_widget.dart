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
                blurRadius: 4.r,
                spreadRadius: 0.r,
              ),
            ],
            borderRadius: BorderRadius.circular(17.r),
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
                    imageUrl: APIEndpoints.imgPath + teacher.img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => Image.asset(
                      'assets/images/Teacher (2).png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/Teacher (2).png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
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
                                  style: Styles.semiBold14.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  '${teacher.fname} ${teacher.lname}',
                                  style: Styles.semiBold14.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'أستاذ ${teacher.sec}',
                              style: Styles.semiBold10.copyWith(
                                color: Colors.grey,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'تقييم',
                                  style: Styles.semiBold10.copyWith(
                                    color: Colors.grey,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                RatingBar(
                                  ignoreGestures: true,
                                  initialRating: double.parse(teacher.rank),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 10.r,
                                  ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star,
                                        color: Colors.amber),
                                    half: const Icon(Icons.star_half,
                                        color: Colors.amber),
                                    empty: const Icon(Icons.star_border,
                                        color: Colors.amber),
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                            Text(
                              'مادة ${teacher.sec}',
                              style: Styles.semiBold10.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
