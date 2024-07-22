import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backGroundColor = AppColors.primaryColor, this.iconColor = AppColors.primaryColor,
  });

  final String title;
  final Color backGroundColor,iconColor;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Styles.bold24.copyWith(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: backGroundColor,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {
            Get.back();

          },
          icon: ImageIcon(
            const AssetImage(
              'assets/images/back.png',
            ),
            size: 34,
            color: iconColor,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
