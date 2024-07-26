import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/subject_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_single_subject_widget.dart';

class AllSubjectView extends StatelessWidget {
  const AllSubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'مواد الصف',
        backGroundColor: Colors.transparent,
        titleColor: AppColors.primaryColor,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, // Slightly reduce the width to center
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15.0), // Optional padding for better spacing
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 15.0, // Space between rows
            ),
            itemCount: 7, // Number of items in the grid
            itemBuilder: (context, index) {
              return HomeSingleSubjectWidget(
                onTap: () {
                  Get.to(const SubjectView(),transition: Transition.fade);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
