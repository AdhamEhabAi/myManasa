import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/features/Quiz/presentation/views/exam_view.dart';

class StartExamDialog extends StatelessWidget {
  const StartExamDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'هل تريد بدء الأختبار؟',
              style: Styles.semiBold20.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      text: Text(
                        'نعم',
                        style: Styles.semiBold20.copyWith(height: .3,color: Colors.white),
                      ),
                      onPressed: () {
                        // Get.to(const ExamView(),transition: Transition.fadeIn);

                      }),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: CustomButton(
                      backGroundColor: Colors.white,
                      text: Text(
                        'لا',
                        style: Styles.semiBold20.copyWith(height: .3,color: Colors.black),
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
