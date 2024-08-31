import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/dialogs/start_exam_dialog.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/Quiz/presentation/views/history_view.dart';
import 'package:my_manasa/features/Quiz/presentation/views/widgets/quiz_widget.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الأختبارات',
            style: Styles.bold20.copyWith(color: AppColors.primaryColor),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  Get.to(const HistoryView(), transition: Transition.fade);
                },
                child: const ImageIcon(
                  AssetImage('assets/images/history.png'),
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return QuizWidget(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const StartExamDialog(),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
