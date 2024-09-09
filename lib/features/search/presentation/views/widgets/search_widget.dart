import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.search,color: AppColors.primaryColor,),
          ),

          Text(title,style: Styles.semiBold16,)
        ],
      ),
    );
  }
}
