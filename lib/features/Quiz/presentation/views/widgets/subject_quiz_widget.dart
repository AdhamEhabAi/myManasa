import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_percent_indicator.dart';

class SubjectQuizWidget extends StatelessWidget {
  const SubjectQuizWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                // offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 4.5,
                  height: 60,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Image.asset(
                    'assets/images/QuizDone.png',
                    fit: BoxFit.fill,
                  )),
              Text(
                'أختبار 1',
                style: Styles.bold16.copyWith(color: AppColors.primaryColor),
              ),
              Row(
                children: [
                  Text('15/7/2024',style: Styles.regular12.copyWith(color: Colors.grey),),
                  const SizedBox(width: 20,),
                  const CustomPercentIndicator(
                    footerText: '',
                      titleText: 'درجة',
                      doneVideos: 15,
                      totalVideos: 30,
                      lineColor: Colors.blue),
                  const SizedBox(width: 20,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
