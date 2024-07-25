import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.search,color: AppColors.primaryColor,),
        ),

        Text('اللغة العربية',style: Styles.semiBold16,)
      ],
    );
  }
}
