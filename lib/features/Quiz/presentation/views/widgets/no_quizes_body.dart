import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class NoQuizesBody extends StatelessWidget {
  const NoQuizesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/no_quizes_image.png', width: MediaQuery.of(context).size.width / 2,),
            const SizedBox(height: 20,),
            Text(
              'لا يوجد اختبارات لمواد اشتركت فيها,في الوقت الحالي',
              style: Styles.semiBold16.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
