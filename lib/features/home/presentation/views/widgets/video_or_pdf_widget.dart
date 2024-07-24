import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';

class VideoOrPdfWidget extends StatelessWidget {
  const VideoOrPdfWidget({
    super.key,
    required this.containerWidth,
    required this.isSelected,
    required this.halfWidth,
    required this.onSwitch,
  });

  final double containerWidth;
  final bool isSelected;
  final double halfWidth;
  final Function(bool) onSwitch;

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
                  style: Styles.bold22.copyWith(height: 2.5),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'الكتاب',
                  textAlign: TextAlign.center,
                  style: Styles.bold22.copyWith(height: 2.5),
                ),
              ),
            ],
          ),
        ),
        AnimatedPositioned(
          left: isSelected ? halfWidth - 10 : 0,
          top: 0,
          bottom: 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: halfWidth,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(9.53),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              onSwitch(isSelected);
            },
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'الفيديوهات',
                      style: Styles.bold22.copyWith(
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'الكتاب',
                      textAlign: TextAlign.center,
                      style: Styles.bold22.copyWith(
                        color: isSelected ? Colors.grey : Colors.white,
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
