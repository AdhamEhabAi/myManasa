import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/all_widget.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_single_teacher_widget.dart';

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
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: AllWidget(
              onTap: (){},
              text: 'أشهر المدرسين',
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
                itemBuilder: (context, index) => const HomeSingleTeacherWidget(),
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
