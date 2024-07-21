import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/register_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/on_boarding_background.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnBoardingBackGround(),
          Column(
            children: [
              const Spacer(flex: 3,),
              Image.asset('assets/images/onboarding_image.png'),
              const Spacer(flex: 1,),

              const Column(
                children: [
                  Text(
                    'رحلة تعلم افضل\n المستقبل يبدأ من هنا',
                    style: Styles.regular24,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'علي منصتنا نقدم لكم أدوات و موارد تعلمية مبتكرة تمكنكم من استكساف عوالم جديدة و تطوير قراتكم بشكل شامل',
                    style: Styles.regular12,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(flex: 2,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    borderRadius: 27,
                      width: MediaQuery.of(context).size.width/2.4,
                      text: Text(
                        'تسجيل الدخول',
                        style: Styles.semiBold20.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                      Get.to(const LoginView(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 600));
                      }),
                  CustomButton(
                    borderRadius: 27,
                    backGroundColor: const Color(0xFFDBE3FF),
                    width: MediaQuery.of(context).size.width/2.4,
                      text: Text(
                        'انشاء حساب',
                        style: Styles.semiBold20.copyWith(color: Colors.black),
                      ),
                      onPressed: () {
                        Get.to(const RegisterView(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 600));

                      }),

                ],
              ),
              const Spacer(flex: 1,),

            ],
          ),
        ],
      ),
    );
  }
}
