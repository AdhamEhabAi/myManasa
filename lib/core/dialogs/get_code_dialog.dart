import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/dialogs/buy_completed_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/info_textfield.dart';

class GetCodeDialog extends StatelessWidget {
  const GetCodeDialog({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,

        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أدخل الكود',
              style: Styles.semiBold20.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 20.w),
              child: InfoTextField(
                width: double.infinity,
                textEditingController: textEditingController,
                hintText: '',
              ),
            ),
             SizedBox(height: 20.h),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 40.0.w),
              child: CustomButton(
                text: Text(
                  'شراء',
                  style: Styles.semiBold14
                      .copyWith(color: Colors.white),
                ),
                borderRadius: 10.r,
                onPressed: () {
                  Get.back();
                  showDialog(context: context, builder: (context) => const BuyCompletedDialog(),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
