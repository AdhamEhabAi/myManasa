import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_percent_indicator.dart';
import 'package:my_manasa/features/Quiz/data/model/exam_history_model.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    super.key,
    required this.onTap,
    required this.examHistory,
  });

  final VoidCallback onTap;
  final ExamHistory examHistory;

  // Function to format the date
  String formatDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('yyyy-MM-dd').format(parsedDate); // Customize the format as needed
    } catch (e) {
      return date; // Return the original date if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding, vertical: AppPadding.padding),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4.5,
                    height: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/QuizDone.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    examHistory.name,
                                    style: Styles.bold14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4), // Spacing between name and date
                                  Text(
                                    formatDate(examHistory.date), // Display formatted date
                                    style: Styles.semiBold14, // Customize the text style as needed
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            CustomPercentIndicator(
                              titleText: '',
                              footerText: 'درجة',
                              radius: 30,
                              lineRadius: 5,
                              doneVideos: int.parse(examHistory.userScore.score),
                              totalVideos: int.parse(examHistory.userScore.correctAnswers),
                              lineColor: Colors.greenAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
