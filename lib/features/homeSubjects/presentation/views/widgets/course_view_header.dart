import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CourseViewHeader extends StatelessWidget {
  const CourseViewHeader({
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
                bottomLeft: Radius.circular(24.r)),
            image: DecorationImage(
                image:
                AssetImage('assets/images/main_course_image.png',),
                fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 20.h,
          right: 20.w,
          child: InkWell(
            onTap: (){
              Get.back();
            },
            child: ImageIcon(
              AssetImage(
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
            children: [SvgPicture.asset('assets/images/playIcon.svg'),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Icon(Icons.play_arrow,color: Colors.white,size: 50.w,))],


          ),
        ),
      ],
    );
  }
}
