import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/features/authentication/presentation/views/on_boarding_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }

  void executeNavigation(){
    Future.delayed(const Duration(seconds: 3),() => Get.to(const OnBoardingView(),transition: Transition.fadeIn,duration: const Duration(seconds: 1)),);
  }
}

