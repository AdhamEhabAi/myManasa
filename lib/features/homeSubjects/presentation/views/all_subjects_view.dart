import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            mainAxisSpacing: 15.0.w, // Space between rows
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
    );
  }
}
