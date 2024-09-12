import 'package:flutter/material.dart';

class SquareProfileCard extends StatelessWidget {
  const SquareProfileCard({required this.title,required this.subTitle,required this.icon,super.key, required this.backGroundColor, required this.onTap});

  final IconData? icon;
  final String title;
  final String subTitle;
  final Color backGroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 150,
        height: 170,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.4),blurRadius: 5),
          ],
          borderRadius: BorderRadius.circular(12),
          color: backGroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon,color: Colors.white,),
            Text(title,style: const TextStyle(color: Colors.white,fontSize: 20),),
            Text(subTitle,style: const TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
