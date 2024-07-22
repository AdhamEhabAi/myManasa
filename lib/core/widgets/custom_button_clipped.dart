import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';

class CustomButtonClipped extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final CustomClipper<Path> clipper;
  final TextAlign textAlign;

  const CustomButtonClipped({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.clipper, required this.textAlign,
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            width: MediaQuery.of(context).size.width/2,
            child: Text(
              text,
              style: Styles.semiBold18.copyWith(color: textColor),
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}
