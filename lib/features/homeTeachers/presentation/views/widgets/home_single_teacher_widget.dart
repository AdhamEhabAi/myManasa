import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSingleTeacherWidget extends StatelessWidget {
  const HomeSingleTeacherWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppPadding.padding.w, // Adapted padding
        top: 10.h, // Adapted padding
        bottom: 10.h, // Adapted padding
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7, // Kept dynamic width
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 4.r, // Adapted blurRadius
                spreadRadius: 0.r, // Adapted spreadRadius
              ),
            ],
            borderRadius: BorderRadius.circular(17.r), // Adapted borderRadius
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17.r), // Adapted borderRadius
                      topRight: Radius.circular(17.r), // Adapted borderRadius
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
                        offset: const Offset(0, 4),
                        blurRadius: 4.r, // Adapted blurRadius
                        spreadRadius: 0.r, // Adapted spreadRadius
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(17.r), // Adapted borderRadius
                      bottomLeft: Radius.circular(17.r), // Adapted borderRadius
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r), // Adapted padding
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
                                    fontSize: 14.sp, // Adapted font size
                                  ),
                                ),
                                Text(
                                  'مجدي بلال',
                                  style: Styles.semiBold14.copyWith(
                                    fontSize: 14.sp, // Adapted font size
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h), // Adapted height
                            Text(
                              'دكتور في مادة العلوم',
                              style: Styles.semiBold10.copyWith(
                                color: Colors.grey,
                                fontSize: 10.sp, // Adapted font size
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
                                    fontSize: 10.sp, // Adapted font size
                                  ),
                                ),
                                SizedBox(height: 5.h), // Adapted height
                                RatingBar(
                                  ignoreGestures: true,
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 10.r, // Adapted item size
                                  ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star, color: Colors.amber),
                                    half: const Icon(Icons.star_half, color: Colors.amber),
                                    empty: const Icon(Icons.star_border, color: Colors.amber),
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                            Text(
                              'مادة العلوم',
                              style: Styles.semiBold10.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 10.sp, // Adapted font size
                              ),
                            )
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
