import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeSubjects/presentation/manager/subject_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/subject_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_single_subject_widget.dart';

class AllSubjectView extends StatelessWidget {
  const AllSubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<SubjectCubit>(context);

    // Fetch subjects only if the list is empty
    if (provider.subjectsList.isEmpty) {
      provider.fetchSubjects();
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'مواد الصف',
        backGroundColor: Colors.transparent,
        titleColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          final provider = BlocProvider.of<SubjectCubit>(context);

          if (state is SubjectsLoading && provider.subjectsList.isEmpty) {
            return const Center(child: CircularProgressIndicator()); // Show loading indicator
          } else if (state is SubjectsFail) {
            return Center(child: Text(state.message)); // Show error message
          } else if (provider.subjectsList.isNotEmpty) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: provider.subjectsList.length,
                itemBuilder: (context, index) {
                  return HomeSingleSubjectWidget(
                    subject: provider.subjectsList[index], // Use subjectsList from provider
                    onTap: () {
                      trans.Get.to(
                            () => SubjectView(subject: provider.subjectsList[index]),
                        transition: trans.Transition.fade,
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('No subjects available')); // Placeholder if no subjects
          }
        },
      ),
    );
  }
}
