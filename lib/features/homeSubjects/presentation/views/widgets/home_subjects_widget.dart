import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/all_subjects_view.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/subject_view.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/all_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_single_subject_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/subject_dots_indicator.dart';
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
      padding: EdgeInsets.only(bottom: 12.h), // Adapted padding
      child: Column(
        children: [
          SizedBox(height: 20.h), // Adapted height
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w), // Adapted padding
            child: AllWidget(
              onTap: (){
                Get.to(const AllSubjectView(),transition: Transition.downToUp);
              },
              text: 'مواد الصف',
            ),
          ),
          SizedBox(height: 10.h), // Adapted height

          Padding(
            padding: EdgeInsets.only(right: AppPadding.padding.w), // Adapted padding
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.3, // Kept dynamic height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) => HomeSingleSubjectWidget(
                  onTap: () {
                    Get.to(const SubjectView(), transition: Transition.fade);
                  },
                ),
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
