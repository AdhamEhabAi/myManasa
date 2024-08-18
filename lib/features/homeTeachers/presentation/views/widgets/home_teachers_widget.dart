import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/all_teachers_view.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/teacher_view.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/all_widget.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/home_single_teacher_widget.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/teachers_dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTeachersWidget extends StatefulWidget {
  const HomeTeachersWidget({super.key});

  @override
  State<HomeTeachersWidget> createState() => _HomeTeachersWidgetState();
}

class _HomeTeachersWidgetState extends State<HomeTeachersWidget> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h), // Adapted padding
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w), // Adapted padding
            child: AllWidget(
              onTap: () {
                Get.to(const AllTeachersView(), transition: Transition.downToUp);
              },
              text: 'أشهر المدرسين',
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
                itemBuilder: (context, index) => HomeSingleTeacherWidget(
                  onTap: () {
                    Get.to(const TeacherView(), transition: Transition.fadeIn);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h), // Adapted height

          TeachersDotsIndicator(currentPage: _currentPage),
        ],
      ),
    );
  }
}
