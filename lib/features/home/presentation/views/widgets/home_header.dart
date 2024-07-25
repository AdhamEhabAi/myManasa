import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_text_field.dart';
import 'package:my_manasa/features/search/presentation/views/search_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/4,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'مرحبا, Adham Ehab',
              style: Styles.regular24.copyWith(color: Colors.white),
            ),

            CustomTextField(
              enabled: false,
              onTap: (){
                Get.to(const SearchView(),transition: Transition.fadeIn);
              },
              labelText: 'بحث',
              color: Colors.transparent,
              prefix: const Icon(Icons.search,size: 30,color: Colors.white,),
              suffix: Image.asset('assets/images/search.png',width: 20,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
