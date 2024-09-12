import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/features/authentication/presentation/views/login_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // or prefs.remove('isLoggedIn');

  // Navigate to the login or onboarding screen
  Get.offAll(() => const LoginView(), transition: Transition.fadeIn);
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'ادخل البريد الالكتروني الصحيح'
      : null;
}

Future<void> openWhatsApp(String phoneNumber) async {
  PermissionStatus status = await Permission.phone.request();

  if (status.isGranted) {
    try {
      String url = 'https://wa.me/$phoneNumber';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } else if (status.isPermanentlyDenied) {
    Get.snackbar(
      'Permission Denied',
      'Please grant phone permission from settings to open WhatsApp',
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        onPressed: () {
          openAppSettings();
        },
        child: const Text('Open Settings'),
      ),
    );
  } else {
    Get.snackbar(
      'Permission Denied',
      'Please grant phone permission to open WhatsApp',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  PermissionStatus status = await Permission.phone.request();

  if (status.isGranted) {
    try {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        throw 'Could not launch $launchUri';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } else if (status.isPermanentlyDenied) {
    Get.snackbar(
      'Permission Denied',
      'Please grant phone permission from settings to make calls',
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        onPressed: () {
          openAppSettings();
        },
        child: const Text('Open Settings'),
      ),
    );
  } else {
    Get.snackbar(
      'Permission Denied',
      'Please grant phone permission to make calls',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
