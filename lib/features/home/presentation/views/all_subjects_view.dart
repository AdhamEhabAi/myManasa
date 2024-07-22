import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_single_subject_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(
          AppPadding.padding,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 15.0, // Space between rows
            ),
            itemCount: 7, // Number of items in the grid
            itemBuilder: (context, index) {
              return HomeSingleSubjectWidget(
                onTap: () {
                  // Handle tap
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
