import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    super.key,
  });

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
                        Row(
                          children: [
                            const Text(
                              'يوجد اختبار الأن',
                              style: Styles.semiBold12_95,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(10),
                                color: Colors.greenAccent,
                              ),
                            ),
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
