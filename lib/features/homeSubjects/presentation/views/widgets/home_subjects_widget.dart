import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as trans;
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/shimmer/subjects_shimmer.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/all_subjects_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/subject_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/manager/subject_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_single_subject_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/subject_dots_indicator.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/all_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSubjectsWidget extends StatefulWidget {
  const HomeSubjectsWidget({super.key});

  @override
  State<HomeSubjectsWidget> createState() => _HomeSubjectsWidgetState();
}

class _HomeSubjectsWidgetState extends State<HomeSubjectsWidget> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SubjectCubit>(context).fetchSubjects();

    // Page controller listener for dots indicator
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        children: [
          SizedBox(height: 20.h), // Adapted height
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: AllWidget(
              onTap: () {
                trans.Get.to(const AllSubjectView(),
                    transition: trans.Transition.downToUp);
              },
              text: 'مواد الصف',
            ),
          ),
          SizedBox(height: 10.h), // Adapted height
          Padding(
            padding:
            EdgeInsets.only(right: AppPadding.padding.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.3,
              child: BlocBuilder<SubjectCubit, SubjectState>(
                builder: (context, state) {
                  final provider = BlocProvider.of<SubjectCubit>(context);

                  if (state is SubjectsLoading && provider.subjectsList.isEmpty) {
                    return const SubjectsShimmer();
                  } else if (state is SubjectsFail) {
                    return Center(child: Text(state.message));
                  } else if (provider.subjectsList.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      itemCount: provider.subjectsList.length.clamp(0, 3),
                      itemBuilder: (context, index) => HomeSingleSubjectWidget(
                        subject: provider.subjectsList[index], // Use subjectsList from provider
                        onTap: () {
                          trans.Get.to(
                                () => SubjectView(subject: provider.subjectsList[index]),
                            transition: trans.Transition.fade,
                          );
                        },
                      ),
                    );
                  } else {
                    // Show a placeholder if there are no subjects
                    return const Center(child: Text('No subjects available'));
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20.h), // Adapted height
          SubjectDotsIndicator(currentPage: _currentPage),
        ],
      ),
    );
  }
}
