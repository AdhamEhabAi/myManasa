import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';

class WrongCodeDialog extends StatelessWidget {
  const WrongCodeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height /4,

        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'الكود خطأ',
              style: Styles.semiBold20.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Image.asset('assets/images/wrong.png'),

          ],
        ),
      ),
    );
  }
}
