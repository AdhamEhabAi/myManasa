import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(10.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(child: Text(text,style: Styles.semiBold16,)),
          ),
        ),
        const Text('الكل',style: Styles.semiBold16,),
        const Icon(Icons.arrow_forward_ios_sharp,color: AppColors.primaryColor,size: 30,),
      ],
    );
  }
}
