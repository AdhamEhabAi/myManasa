import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/dialogs/buy_completed_dialog.dart';
import 'package:my_manasa/core/dialogs/wrong_code_dialog.dart';
import 'package:my_manasa/core/managers/code_cubit/code_cubit.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/info_textfield.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: InfoTextField(
                width: double.infinity,
                textEditingController: textEditingController,
                hintText: '',
              ),
            ),
            SizedBox(height: 20.h),
            BlocConsumer<CodeCubit, CodeState>(
              listener: (context, state) {
                if (state is CodeSuccess) {
                  Get.back(); // Close the current dialog
                  showDialog(
                    context: context,
                    builder: (context) => const BuyCompletedDialog(),
                  );
                } else if (state is CodeError) {
                  Get.back(); // Close the current dialog
                  showDialog(
                    context: context,
                    builder: (context) => const WrongCodeDialog(),
                  );
                }
              },
              builder: (context, state) {
                if (state is CodeLoading) {
                  return const CircularProgressIndicator();  // Show loading indicator
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                  child: CustomButton(
                    text: Text(
                      'شراء',
                      style: Styles.semiBold14.copyWith(color: Colors.white),
                    ),
                    borderRadius: 10.r,
                    onPressed: () {
                      final code = textEditingController.text.trim();
                      if (code.isNotEmpty) {
                        String userId = context.read<AuthCubit>().userModel!.id;
                        context.read<CodeCubit>().purchaseCourse(userId: userId, code: code);
                      } else {
                        ToastM.show('يرجى إدخال كود صالح.');
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
