import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AllTeachersTeacherWidget extends StatelessWidget {
  final Teacher teacher;
  final VoidCallback onTap;

  const AllTeachersTeacherWidget({
    super.key,
    required this.onTap,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r), // Responsive padding
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color with higher opacity
                offset: const Offset(0, 4), // Offset to create a downward shadow effect
                blurRadius: 4.r, // Increased blur radius for a more prominent shadow
                spreadRadius: 0, // No spread radius
              ),
            ],
            borderRadius: BorderRadius.circular(17.r), // Responsive borderRadius
            color: Colors.white, // Background color for the container
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust to minimum size needed
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17.r),
                  topRight: Radius.circular(17.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: APIEndpoints.imgPath + teacher.img,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  height: 100.h, // Set a fixed height for the image
                  width: double.infinity, // Full width of the parent
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(17.r), // Responsive borderRadius
                    bottomLeft: Radius.circular(17.r), // Responsive borderRadius
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h), // Add padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'مستر /',
                                style: Styles.semiBold10.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 8.sp, // Reduced font size
                                ),
                              ),
                              SizedBox(width: 3.w), // Add spacing
                              Expanded(
                                child: Text(
                                  '${teacher.fname} ${teacher.lname}',
                                  style: Styles.semiBold10.copyWith(
                                    fontSize: 8.sp, // Reduced font size
                                  ),
                                  overflow: TextOverflow.ellipsis, // Handle overflow
                                  maxLines: 1, // Limit to one line
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h), // Reduced height
                          Text(
                            'أستاذ ${teacher.sec}',
                            overflow: TextOverflow.ellipsis,
                            style: Styles.semiBold10.copyWith(
                              color: Colors.grey,
                              fontSize: 8.sp, // Reduced font size
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'تقييم',
                          style: Styles.semiBold10.copyWith(
                            color: Colors.grey,
                            fontSize: 8.sp, // Reduced font size
                          ),
                        ),
                        SizedBox(height: 4.h), // Reduced height
                        RatingBar(
                          initialRating: double.parse(teacher.rank),
                          ignoreGestures: true,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 8.w, // Reduced item size
                          ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.amber),
                            half: const Icon(Icons.star_half, color: Colors.amber),
                            empty: const Icon(Icons.star_border, color: Colors.amber),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(height: 4.h), // Reduced height
                        Text(
                          'مادة ${teacher.sec}',
                          style: Styles.semiBold10.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: 8.sp, // Reduced font size
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
