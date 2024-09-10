import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_manasa/core/widgets/custom_percent_indicator.dart';

class ShowMarksDialog extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ShowMarksDialog({
    super.key,
    required this.score,
    required this.totalQuestions,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomPercentIndicator(
              lineRadius: 3,
              radius: 30.r,
              titleText: '',
              doneVideos: score,
              totalVideos: totalQuestions,
              footerText: 'درجة',
              lineColor: Colors.greenAccent,
            ),
            Text(
              'Your score is $score/$totalQuestions',
            ),
          ],
        ),
      ),
    );
  }
}
