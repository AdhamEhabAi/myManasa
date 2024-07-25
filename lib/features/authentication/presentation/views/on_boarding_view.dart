import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button_clipped.dart';
import 'package:my_manasa/core/widgets/left_clipper.dart';
import 'package:my_manasa/core/widgets/right_clipper.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/register_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackGround(),
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
                    'علي منصتنا نقدم لكم أدوات و موارد تعلمية مبتكرة تمكنكم من استكشاف عوالم جديدة و تطوير قراتكم بشكل شامل',
                    style: Styles.regular12,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButtonClipped(
                    onTap: (){
                      Get.to(const LoginView(),transition: Transition.rightToLeft);
                    },
                    textAlign: TextAlign.center,
                    text: 'تسجيل الدخول',
                    backgroundColor: Colors.blue.shade900,
                    textColor: Colors.white,
                    clipper: RightClipper(),
                  ),
                  CustomButtonClipped(
                    onTap: (){
                      Get.to(const RegisterView(),transition: Transition.rightToLeft);
                    },

                    textAlign: TextAlign.center,
                    text: 'انشاء حساب',
                    backgroundColor: Colors.blue.shade100,
                    textColor: Colors.black,
                    clipper: LeftClipper(),
                  ),

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
