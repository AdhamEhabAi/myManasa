import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/utils/funtions.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
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
              'هل تريد تسجيل الخروج؟',
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
                        logout();
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
