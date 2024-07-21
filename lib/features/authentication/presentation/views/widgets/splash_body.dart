import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/images/Group 9.svg',width: MediaQuery.of(context).size.width /1.2),
          ],
        ),
        Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 3,
                child:
                Image.asset('assets/images/logo.png', fit: BoxFit.fill)),
            Center(
              child: Text(
                'West online Academy',
                style:
                Styles.semiBold20.copyWith(color: AppColors.primaryColor),
              ),
            )
          ],
        ),
        SvgPicture.asset('assets/images/Group 8.svg',width: MediaQuery.of(context).size.width /1.5),
      ],
    );
  }
}
