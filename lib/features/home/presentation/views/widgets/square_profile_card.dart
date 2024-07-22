import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';

class SquareProfileCard extends StatelessWidget {
  const SquareProfileCard({required this.title,required this.subTitle,required this.icon,super.key});

  final IconData? icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 150,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4),blurRadius: 5),
        ],
        borderRadius: BorderRadius.circular(12),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,color: Colors.white,),
          Text(title,style: const TextStyle(color: Colors.white,fontSize: 20),),
          Text(subTitle,style: const TextStyle(color: Colors.white,fontSize: 14),),
        ],
      ),
    );
  }
}
