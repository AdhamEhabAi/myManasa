import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              clipBehavior: Clip
                  .hardEdge, // Ensures the border radius applies to the image
              child: CachedNetworkImage(
                imageUrl: APIEndpoints.imgPath + teacher.img,
                fit: BoxFit.cover,
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
                    'مستر/${teacher.fname} ${teacher.lname}', // Use dynamic data
                    style: Styles.semiBold20,
                  ),
                  Text(
                    'أستاذ في ${teacher.sec}', // Use dynamic data
                    style: Styles.semiBold14,
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
                          icon: const ImageIcon(
                              AssetImage('assets/images/whatsapp.png'),
                              color: AppColors.primaryColor),
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
                          icon: const Icon(Icons.call,
                              color: AppColors.primaryColor),
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
