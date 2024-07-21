import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class HomeSingleCourseWidget extends StatelessWidget {
  const HomeSingleCourseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:AppPadding.padding),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage('assets/images/courseImage.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              right: 30,
              child: Text(
                'علوم',
                style: Styles.bold32.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
