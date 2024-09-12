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

class _SplashViewState extends State<SplashView>  with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    executeNavigation();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      executeNavigation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }





  void executeNavigation() async {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    await Future.delayed(const Duration(seconds: 1)); // Small delay before checking preferences

    authCubit.userModel = await authCubit.getUserFromPreferences();
    if (authCubit.userModel != null) {
      trans.Get.off(const MainView(), transition: trans.Transition.fadeIn, duration: const Duration(seconds: 1));
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        trans.Get.off(const OnBoardingView(), transition: trans.Transition.fadeIn, duration: const Duration(seconds: 1));
      });
    }
  }



}
