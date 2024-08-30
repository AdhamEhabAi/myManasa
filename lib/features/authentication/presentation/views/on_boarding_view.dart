import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_button_clipped.dart';
import 'package:my_manasa/core/widgets/left_clipper.dart';
import 'package:my_manasa/core/widgets/right_clipper.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/register_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  double upperImageTop = 600.h;

  double upperImageLeft = 0;

  double lowerImageTop = 0;
    // Starting from top
  double lowerImageRight = 0;
  // Starting from right
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  void _startAnimation() {
    setState(() {
      // New positions after animation
      upperImageTop = 0;
      upperImageLeft = MediaQuery.of(context).size.width - 350.w;

      lowerImageTop = MediaQuery.of(context).size.height - 350.h;  // Move to bottom
      lowerImageRight = MediaQuery.of(context).size.width -350.w; // Move to left
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                // Upper image animates from bottom-left to top-right
                AnimatedPositioned(
                  top: upperImageTop,
                  left: upperImageLeft,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/images/MainBackGroundUpper.png',
                    fit: BoxFit.fill,

                  ),
                ),

                // Lower image animates from top-right to bottom-left
                AnimatedPositioned(
                  top: lowerImageTop,
                  right: lowerImageRight,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/images/MainBackgorundLower.png',
                    fit: BoxFit.fill,

                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Image.asset(
                'assets/images/onboardingbook.png',
                width: 300.w,
                height: 300.h,
              ),
              const Spacer(flex: 1),
              Column(
                children: [
                  Text(
                    'رحلة تعلم افضل\n المستقبل يبدأ من هنا',
                    style: Styles.regular24.copyWith(fontSize: 24.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'علي منصتنا نقدم لكم أدوات و موارد تعلمية مبتكرة تمكنكم من استكشاف عوالم جديدة و تطوير قراتكم بشكل شامل',
                      style: Styles.regular12,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButtonClipped(
                    onTap: () {
                      Get.to(const LoginView(), transition: Transition.rightToLeft);
                    },
                    textAlign: TextAlign.center,
                    text: 'تسجيل الدخول',
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    clipper: RightClipper(),
                  ),
                  CustomButtonClipped(
                    onTap: () {
                      Get.to(const RegisterView(), transition: Transition.rightToLeft);
                    },
                    textAlign: TextAlign.center,
                    text: 'انشاء حساب',
                    backgroundColor: AppColors.secondaryColor,
                    textColor: Colors.white,
                    clipper: LeftClipper(),
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
