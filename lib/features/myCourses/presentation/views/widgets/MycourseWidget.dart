import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCourseWidget extends StatelessWidget {
  const MyCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: AppPadding.padding),
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
                    'assets/images/courseImage (2).png',
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'مع مستر / نبيل وليم',
                                style: Styles.semiBold12_95,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 12,
                              child: Image.asset(
                                'assets/images/smallTeacher.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            CustomPercentIndicator(doneVideos: 21,lineColor: Colors.blue,titleText: 'نصوص',totalVideos: 30,),
                            CustomPercentIndicator(doneVideos: 21,lineColor: Colors.yellowAccent,titleText: 'القراءة',totalVideos: 30,),
                            CustomPercentIndicator(doneVideos: 21,lineColor: Colors.greenAccent,titleText: 'القصة',totalVideos: 30,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                'علوم',
                style: Styles.bold14,
              ))
        ],
      ),
    );
  }
}

