import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.width = 176,
    this.textInputType = TextInputType.text,
    this.textStyle,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final double width;
  final TextInputType textInputType;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color(0xFFEEEEEE),
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          style: textStyle ?? Styles.semiBold9_25, // Use the provided textStyle or default to Styles.semiBold9_25
          keyboardType: textInputType,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            hintText: hintText, // Added hint text
            contentPadding: EdgeInsets.symmetric(vertical: 8.h), // Adjust content padding for better spacing
          ),
        ),
      ),
    );
  }
}
