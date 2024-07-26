import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required TextEditingController codeController,
    required this.hintText,
    this.width = 176,
    this.textInputType = TextInputType.text,
    this.textStyle = Styles.semiBold9_25,
  }) : textEditingController = codeController;

  final TextEditingController textEditingController;
  final String hintText;
  final double width;
  final TextInputType textInputType;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFEEEEEE),
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          style: textStyle,
          keyboardType: textInputType,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primaryColor,width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  const BorderSide(color:AppColors.primaryColor,width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor,width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
