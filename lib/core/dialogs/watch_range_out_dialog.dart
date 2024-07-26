import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';

class WatchRangeOutDialog extends StatelessWidget {
  const WatchRangeOutDialog({
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
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'لقد تخطيت عدد الماهدة المسموح بيها',
              style: Styles.semiBold14.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              'هل تريد اعادة الشراء؟',
              style: Styles.semiBold14.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      text: Text(
                        'شراء',
                        style: Styles.semiBold16.copyWith(height: .3,color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: CustomButton(
                      backGroundColor: Colors.white,
                      text: Text(
                        'لا',
                        style: Styles.semiBold16.copyWith(height: .3,color: Colors.black),
                      ),
                      onPressed: () {}),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
