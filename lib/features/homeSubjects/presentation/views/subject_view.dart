import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/teacher_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/manager/subject_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/teacher_subject_widget.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({super.key, required this.subject});
  final SubjectModel subject;

  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  @override
  void initState() {
    super.initState();
    final subjectCubit = context.read<SubjectCubit>();
    subjectCubit.fetchAllTeachersForSubject(subjectName: widget.subject.name);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.subject.name,
          backGroundColor: Colors.transparent,
          titleColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.padding,
            right: AppPadding.padding,
            top: AppPadding.padding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أشهر المدرسين',
                style: Styles.semiBold20,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SubjectCubit, SubjectState>(
                  builder: (context, state) {
                    if (state is AllTeachersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AllTeachersLoaded) {
                      final teachersList = state.teachers; // Use teachers list from the state
                      if (teachersList.isEmpty) {
                        return Center(child: Text('لا يوجد مدرسين', style: Styles.semiBold20));
                      }
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final teacher = teachersList[index];
                          return TeacherSubjectWidget(
                            teacher: teacher,
                            onTap: () {
                              g.Get.to(
                                TeacherView(teacher: teacher),
                                transition: g.Transition.fadeIn,
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 20),
                        itemCount: teachersList.length,
                      );
                    } else if (state is AllTeachersFail) {
                      return Center(child: Text(state.message, style: Styles.semiBold20));
                    } else {
                      return Center(child: Text('لا يوجد مدرسين', style: Styles.semiBold20));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
