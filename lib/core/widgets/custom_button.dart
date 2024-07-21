import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backGroundColor = AppColors.primaryColor, this.width = double.infinity, this.borderRadius = 6.15,
  });
  final Text text;
  final VoidCallback onPressed;
  final Color backGroundColor;
  final double width;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backGroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: text,
          )),
    );
  }
}
