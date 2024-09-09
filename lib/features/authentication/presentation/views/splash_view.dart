import 'package:flutter/material.dart';
import 'package:get/get.dart'as trans;
import 'package:my_manasa/features/authentication/presentation/views/on_boarding_view.dart';
import 'package:my_manasa/features/authentication/presentation/views/widgets/splash_body.dart';
import 'package:my_manasa/features/home/presentation/views/main_view.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }

  void executeNavigation() async {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    // Try to load the saved user from SharedPreferences
    authCubit.userModel = await authCubit.getUserFromPreferences();

    if (authCubit.userModel != null) {
      // If a user is found, navigate directly to the main view
      trans.Get.off(const MainView(), transition: trans.Transition.fadeIn, duration: const Duration(seconds: 1));
    } else {
      // If no user is found, navigate to the onboarding screen
      Future.delayed(const Duration(seconds: 3), () {
        trans.Get.off(const OnBoardingView(), transition:trans.Transition.fadeIn, duration: const Duration(seconds: 1));
      });
    }
  }
}
