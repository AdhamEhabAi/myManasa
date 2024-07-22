import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(child: Text(text,style: Styles.semiBold20,)),
         InkWell(
           onTap: onTap,
             child: Text('الكل',style: Styles.semiBold16.copyWith(decoration: TextDecoration.underline),)),
      ],
    );
  }
}
