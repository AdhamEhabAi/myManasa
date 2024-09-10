import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/Quiz/presentation/views/exam_view.dart';
import 'package:my_manasa/features/Quiz/presentation/views/widgets/history_quiz_widget.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'سجل الأختبارات',
        titleColor: AppColors.primaryColor,
        backGroundColor: Colors.transparent,),
        body: Center(child: Text('لا يوجد امتحانات',style: Styles.bold20,),),
        // body: SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        //   child: ListView.separated(
        //     scrollDirection: Axis.vertical,
        //     itemBuilder: (context, index) {
        //       return  HistoryQuizWidget(onTap: () {
        //         Get.to( ExamView(quizId: '2',),transition: Transition.fade);
        //       },);
        //     },
        //     separatorBuilder: (context, index) => const SizedBox(
        //       height: 20,
        //     ),
        //     itemCount: 3,
        //   ),
        // ),
      ),
    );
  }
}
