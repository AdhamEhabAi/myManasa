import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        Text(
          'مرحبا, Adham Ehab',
          style: Styles.regular24.copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 15,),

        CustomTextField(
          labelText: 'بحث',
          color: Colors.transparent,
          prefix: const Icon(Icons.search,size: 30,color: AppColors.primaryColor,),
          suffix: Image.asset('assets/images/search.png',width: 20,),
        ),
      ],
    );
  }
}
