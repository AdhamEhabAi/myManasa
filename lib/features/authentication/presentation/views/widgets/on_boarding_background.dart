import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnBoardingBackGround extends StatelessWidget {
  const OnBoardingBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 4,
            child: SvgPicture.asset(
              'assets/images/Group 9.svg',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                  duration: const Duration(seconds: 1),

                  width: MediaQuery.of(context).size.width /1.8,
                  height: MediaQuery.of(context).size.height/4,
                  child: SvgPicture.asset('assets/images/Group 8.svg')),
            ],
          ),
        ],
      ),
    );
  }
}
