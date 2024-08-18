import 'package:get/get.dart';
import 'package:my_manasa/features/authentication/presentation/views/on_boarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // or prefs.remove('isLoggedIn');

  // Navigate to the login or onboarding screen
  Get.offAll(() => const OnBoardingView(), transition: Transition.fadeIn);
}