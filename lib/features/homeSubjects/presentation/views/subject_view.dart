import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/teacher_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/teacher_subject_widget.dart';

class SubjectView extends StatelessWidget {
  const SubjectView({super.key, required this.subject});
final SubjectModel subject;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  CustomAppBar(
          title: subject.name,
          backGroundColor: Colors.transparent,
          titleColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.padding,
              right: AppPadding.padding,
              top: AppPadding.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أشهر المدرسين',
                style: Styles.semiBold20,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TeacherSubjectWidget(
                        onTap: () {
                          Get.to(
                              TeacherView(
                                teacher: Teacher(
                                    id: 'id',
                                    filterTeatcher: 'filterTeatcher',
                                    fname: 'fname',
                                    lname: 'lname',
                                    fnum: 'fnum',
                                    lnum: 'lnum',
                                    yr: 'yr',
                                    sec: 'sec',
                                    email: 'email',
                                    uname: 'uname',
                                    img: 'img',
                                    upass: 'upass',
                                    rank: 'rank',
                                    active: 'active',
                                    rnk: 'rnk',
                                    otname: 'otname'),
                              ),
                              transition: Transition.fadeIn);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: 3),
              ),
              Text(
                'المدرسين',
                style: Styles.semiBold20,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return TeacherSubjectWidget(
                          onTap: () {
                            Get.to( TeacherView(teacher: Teacher(
                                id: 'id',
                                filterTeatcher: 'filterTeatcher',
                                fname: 'fname',
                                lname: 'lname',
                                fnum: 'fnum',
                                lnum: 'lnum',
                                yr: 'yr',
                                sec: 'sec',
                                email: 'email',
                                uname: 'uname',
                                img: 'img',
                                upass: 'upass',
                                rank: 'rank',
                                active: 'active',
                                rnk: 'rnk',
                                otname: 'otname'),),
                                transition: Transition.fadeIn);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
