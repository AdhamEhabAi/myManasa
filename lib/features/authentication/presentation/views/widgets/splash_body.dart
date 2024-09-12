import 'package:flutter/material.dart';

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
            Image.asset('assets/images/uppersplash.png',width: MediaQuery.of(context).size.width /1.2),
          ],
        ),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 3,
              child:
              Image.asset('assets/images/logo.png', fit: BoxFit.contain)),
        ),
        Image.asset('assets/images/lowerSplash.png',width: MediaQuery.of(context).size.width /1.5),
      ],
    );
  }
}
