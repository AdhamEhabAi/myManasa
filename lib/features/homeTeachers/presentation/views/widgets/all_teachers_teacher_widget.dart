import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class AllTeachersTeacherWidget extends StatelessWidget {
  const AllTeachersTeacherWidget({super.key, required this.onTap});
  final VoidCallback onTap;

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
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 4.h), // Responsive offset
                blurRadius: 4.r, // Responsive blurRadius
                spreadRadius: 0.r, // Responsive spreadRadius
              ),
            ],
            borderRadius: BorderRadius.circular(17.r), // Responsive borderRadius
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17.r), // Responsive borderRadius
                      topRight: Radius.circular(17.r), // Responsive borderRadius
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Teacher (2).png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 4.h), // Responsive offset
                        blurRadius: 4.r, // Responsive blurRadius
                        spreadRadius: 0.r, // Responsive spreadRadius
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(17.r), // Responsive borderRadius
                      bottomLeft: Radius.circular(17.r), // Responsive borderRadius
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w), // Responsive padding
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
                                    fontSize: 10.sp, // Responsive fontSize
                                  ),
                                ),
                                Text(
                                  'مجدي بلال',
                                  style: Styles.semiBold10.copyWith(
                                    fontSize: 10.sp, // Responsive fontSize
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h), // Responsive height
                            Text(
                              'دكتور في مادة العلوم',
                              overflow: TextOverflow.ellipsis,
                              style: Styles.semiBold10.copyWith(
                                color: Colors.grey,
                                fontSize: 9.sp, // Responsive fontSize
                              ),
                            ),
                          ],
                        ),
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
                                  fontSize: 10.sp, // Responsive fontSize
                                ),
                              ),
                              SizedBox(height: 5.h), // Responsive height
                              RatingBar(
                                initialRating: 4,
                                ignoreGestures: true,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 10.w, // Responsive itemSize
                                ratingWidget: RatingWidget(
                                  full: const Icon(Icons.star, color: Colors.amber),
                                  half: const Icon(Icons.star_half, color: Colors.amber),
                                  empty: const Icon(Icons.star_border, color: Colors.amber),
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w), // Responsive padding
                            child: Text(
                              'مادة العلوم',
                              style: Styles.semiBold10.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 10.sp, // Responsive fontSize
                              ),
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
