import 'package:flutter/material.dart';
import 'package:my_manasa/core/widgets/custom_percent_indicator.dart';

class ShowMarksDialog extends StatelessWidget {
  const ShowMarksDialog({
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
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            CustomPercentIndicator(
              lineRadius: 3,
              radius: 30,
              titleText: '',
              doneVideos: 15,
              totalVideos: 30,
              footerText: 'درجة',

              lineColor: Colors.greenAccent,),
          ],
        ),
      ),
    );
  }
}
