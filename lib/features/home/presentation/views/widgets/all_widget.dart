import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/utils/styles.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
            child: Text(
          text,
          style: Styles.semiBold20,
        )),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.grey.shade300,
            ),
              child: Center(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 2.0.h),
                child: Text('الكل', style: Styles.semiBold14),
              ))),
        )
      ],
    );
  }
}
