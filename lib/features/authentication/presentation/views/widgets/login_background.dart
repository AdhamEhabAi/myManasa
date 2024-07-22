import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LoginBackGround extends StatelessWidget {
  const LoginBackGround({
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
          Stack(
              children: [
                SvgPicture.asset('assets/images/login_header.svg'),
                Positioned(
                  top: 0,
                  left: 0,
                  child: SvgPicture.asset('assets/images/big_circle.svg'),
                ),
                Positioned(
                  right: 0,
                  bottom: 50,
                  child: SvgPicture.asset('assets/images/small_circle.svg'),
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height / 4,
                  child: SvgPicture.asset('assets/images/Group 8.svg')),
            ],
          ),
        ],
      ),
    );
  }
}
