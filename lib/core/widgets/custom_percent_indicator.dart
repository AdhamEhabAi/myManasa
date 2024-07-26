import 'dart:ffi';

import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(left: 8.0),
      child: CircularPercentIndicator(
        footer: Text(
          footerText,
          style: Styles.semiBold10.copyWith(fontSize: 7),
        ),
        center: Text(
          '$doneVideos/$totalVideos',
          textDirection: TextDirection.ltr,
          style: Styles.semiBold10.copyWith(fontSize: 7),
        ),
        radius: radius,
        lineWidth: lineRadius,
        percent: doneVideos / totalVideos,
        header: Text(
          titleText,
          style: Styles.semiBold10,
        ),
        backgroundColor: Colors.grey.shade300,
        progressColor: lineColor,
      ),
    );
  }
}
