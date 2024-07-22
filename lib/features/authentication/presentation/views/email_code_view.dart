import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:pinput/pinput.dart';

class EmailCodeView extends StatelessWidget {
  const EmailCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 65,
        height: 65,
        textStyle: const TextStyle(fontSize: 22, color: Colors.black),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const MainBackGround(),
            Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/images/back.png',
                      ),
                      size: 34,
                      color: AppColors.primaryColor,
                    ))),
            Padding(
              padding: const EdgeInsets.all(AppPadding.padding),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'أدخل الرمز المكون من 4 أرقام',
                      style: Styles.semiBold24,
                    ),
                    const Row(
                      children: [
                        Text('change',style: Styles.bold12,),
                        Text('mohamedelbarawyy @gamil.com.',textDirection: TextDirection.ltr,style: Styles.semiBold12_95,),

                      ],
                    ),
                    const SizedBox(height: 30,),
                    Center(
                      child: Pinput(
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                        ),
                        onCompleted: (pin) => print(pin),
                      ),
                    ),
                    const SizedBox(height: 80,),

                    Center(
                      child: CustomButton(
                        width: MediaQuery.of(context).size.width/2,
                        borderRadius: 14,
                        text: Text(
                          'استمرار',
                          style: Styles.semiBold20.copyWith(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
