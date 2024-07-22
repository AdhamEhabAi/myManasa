import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/all_widget.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_single_course_widget.dart';

class HomeCoursesWidget extends StatefulWidget {
  const HomeCoursesWidget({super.key});

  @override
  State<HomeCoursesWidget> createState() => _HomeCoursesWidgetState();
}

class _HomeCoursesWidgetState extends State<HomeCoursesWidget> {
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
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: AllWidget(
              text: 'مواد الصف',
            ),
          ),
          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(right: AppPadding.padding,),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) => const HomeSingleCourseWidget(),
              ),
            ),
          ),
          const SizedBox(height: 20,),

          DotsIndicator(
            dotsCount: 3,
            position: _currentPage.ceil(),
            decorator: DotsDecorator(
              size: const Size(15, 15),
              activeSize: const Size(15, 15),
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withOpacity(.2),
            ),
          ),
        ],
      ),
    );
  }
}