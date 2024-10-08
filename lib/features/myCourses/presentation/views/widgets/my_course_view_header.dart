import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import CachedNetworkImage

class MyCourseViewHeader extends StatelessWidget {
  const MyCourseViewHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24.r),
              bottomLeft: Radius.circular(24.r),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: 'APIEndpoints.imgPath + course.img!',
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
        Positioned(
          top: 20.h,
          right: 20.w,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: ImageIcon(
              const AssetImage(
                'assets/images/back.png',
              ),
              size: 34.w,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Positioned(
          bottom: -30.h,
          left: MediaQuery.of(context).size.width / 8,
          child: Stack(
            children: [
              SvgPicture.asset('assets/images/playIcon.svg'),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
