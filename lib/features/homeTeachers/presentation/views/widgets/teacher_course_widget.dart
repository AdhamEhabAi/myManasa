import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class TeacherCourseWidget extends StatelessWidget {
  const TeacherCourseWidget({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                // offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 2,

              )
            ],
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width/4.5,
                  height: 60.h,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r))),
                  child: Image.asset(
                    'assets/images/courseImage (2).png',
                    fit: BoxFit.fill,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'النصوص',
                    style: Styles.bold16,
                  ),
                  Text(
                    '35 فيديو-3ساعات',
                    style: Styles.semiBold16,
                  ),
                ],
              ),
              CircleAvatar(
                radius: 14.r,
                child: Image.asset('assets/images/course icon.png',fit: BoxFit.cover,color: AppColors.secondaryColor,),
              ),
              const SizedBox(width: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
