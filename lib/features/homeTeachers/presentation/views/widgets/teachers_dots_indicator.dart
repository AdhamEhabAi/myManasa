import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';

class TeachersDotsIndicator extends StatelessWidget {
  const TeachersDotsIndicator({
    super.key,
    required double currentPage,
  }) : _currentPage = currentPage;

  final double _currentPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: _currentPage.ceil(),
      decorator: DotsDecorator(
        size: const Size(15, 15),
        activeSize: const Size(15, 15),
        activeColor: AppColors.primaryColor,
        color: AppColors.primaryColor.withOpacity(.2),
      ),
    );
  }
}
