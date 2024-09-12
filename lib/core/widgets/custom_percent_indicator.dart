
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomPercentIndicator extends StatelessWidget {
  const CustomPercentIndicator({
    super.key,
    required this.titleText,
    required this.doneVideos,
    required this.totalVideos,
    required this.lineColor, this.footerText = 'فيديو', this.radius = 14.0, this.lineRadius = 1.0,
  });
  final String  titleText,footerText;
  final int doneVideos, totalVideos;
  final Color lineColor;
  final double radius,lineRadius;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 8.0.w),
      child: CircularPercentIndicator(
        footer: Text(
          footerText,
          style: Styles.semiBold12_95,
        ),
        center: Text(
          '$doneVideos/$totalVideos',
          textDirection: TextDirection.ltr,
          style: Styles.semiBold12_95,
        ),
        radius: radius,
        lineWidth: lineRadius,
        percent: doneVideos / totalVideos,
        header: Text(
          titleText,
          style: Styles.semiBold12_95,
        ),
        backgroundColor: Colors.grey.shade300,
        progressColor: lineColor,
      ),
    );
  }
}
