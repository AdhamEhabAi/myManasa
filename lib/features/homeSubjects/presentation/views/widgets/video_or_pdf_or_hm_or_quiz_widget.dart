import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class VideoOrPdfOrHmOrQuizWidget extends StatelessWidget {
  const VideoOrPdfOrHmOrQuizWidget({
    super.key,
    required this.containerWidth,
    required this.halfWidth,
    required this.quarterWidth,
    required this.onCategorySelected,
    required this.selectedIndex,  // Add selectedIndex
  });

  final double containerWidth;
  final double halfWidth;
  final double quarterWidth;
  final Function(int) onCategorySelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: containerWidth,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.3),
            borderRadius: BorderRadius.circular(9.53),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'الفيديوهات',
                  style: Styles.bold14.copyWith(height: 2.5),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'الكتاب',
                  textAlign: TextAlign.center,
                  style: Styles.bold14.copyWith(height: 2.5),
                ),
              ),
              Expanded(
                child: Text(
                  'الواجبات',
                  style: Styles.bold14.copyWith(height: 2.5),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'الامتحانات',
                  textAlign: TextAlign.center,
                  style: Styles.bold14.copyWith(height: 2.5),
                ),
              ),
            ],
          ),
        ),
        // Animated position based on the selected index
        AnimatedPositioned(
          right: selectedIndex * quarterWidth ,  // Move based on index
          top: 0,
          bottom: 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            width: quarterWidth,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(9.53),
            ),
          ),
        ),
        // Tap handlers for the categories
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () => onCategorySelected(0),  // Video selected
                      child: Text(
                        'الفيديوهات',
                        style: Styles.bold14.copyWith(
                          color: selectedIndex == 0
                              ? Colors.white
                              : Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () => onCategorySelected(1),  // PDF selected
                      child: Text(
                        'الكتاب',
                        textAlign: TextAlign.center,
                        style: Styles.bold14.copyWith(
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () => onCategorySelected(2),  // Homework selected
                      child: Text(
                        'الواجبات',
                        style: Styles.bold14.copyWith(
                          color: selectedIndex == 2
                              ? Colors.white
                              : Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () => onCategorySelected(3),  // Quiz selected
                      child: Text(
                        'الامتحانات',
                        textAlign: TextAlign.center,
                        style: Styles.bold14.copyWith(
                          color: selectedIndex == 3
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
