import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/funtions.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';

class TeacherViewHeader extends StatelessWidget {
  const TeacherViewHeader({
    super.key,
    required this.teacher,
  });

  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    double rating = 0.0;
    try {
      rating = double.parse(teacher.rank); // Safely parse rank
    } catch (e) {
      rating = 0.0; // Default to 0.0 if parsing fails
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
              ),
              clipBehavior: Clip.hardEdge, // Ensures the border radius applies to the image
              child: CachedNetworkImage(
                imageUrl: APIEndpoints.imgPath + teacher.img,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مستر/${teacher.fname} ${teacher.lname}',  // Use dynamic data
                    style: Styles.semiBold20,
                  ),
                  Text(
                    'أستاذ في ${teacher.sec}',  // Use dynamic data
                    style: Styles.semiBold14,
                  ),
                  Row(
                    children: [
                      Text(
                        'تقييم:',
                        style: Styles.semiBold14,
                      ),
                      const SizedBox(width: 5),
                      RatingBar(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 10,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber),
                          half: const Icon(Icons.star_half, color: Colors.amber),
                          empty: const Icon(Icons.star_border, color: Colors.amber),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFf8dedf),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            openWhatsApp(teacher.fnum);
                          },
                          icon: const ImageIcon(AssetImage('assets/images/whatsapp.png'), color: AppColors.primaryColor),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFf8dedf),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            makePhoneCall(teacher.fnum);
                          },
                          icon: const Icon(Icons.call, color: AppColors.primaryColor),
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
    );
  }
}
