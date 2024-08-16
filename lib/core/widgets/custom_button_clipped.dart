import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/utils/styles.dart';

class CustomButtonClipped extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final CustomClipper<Path> clipper;
  final TextAlign textAlign;
  final VoidCallback onTap;

  const CustomButtonClipped({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.clipper, required this.textAlign, required this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: () {
            // Button action here
          },
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              width: MediaQuery.of(context).size.width/2,
              child: Text(
                text,
                style: Styles.semiBold18.copyWith(color: textColor),
                textAlign: textAlign,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
