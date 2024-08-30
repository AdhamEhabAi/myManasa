import 'package:flutter/material.dart';

class MainBackGround extends StatelessWidget {
  const MainBackGround({
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

            child: Image.asset(
              'assets/images/MainBackGroundUpper.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                  duration: const Duration(seconds: 1),

                  child: Image.asset('assets/images/MainBackgorundLower.png',)),
            ],
          ),
        ],
      ),
    );
  }
}
