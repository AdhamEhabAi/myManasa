import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/features/home/presentation/views/home_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_view.dart';
import 'package:my_manasa/features/profile/presentation/views/profile_view.dart';
import 'package:my_manasa/features/Quiz/presentation/views/quiz_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          QuizView(),
          MyCoursesView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, -2), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
              pageController.animateToPage(currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            color: Colors.white,
            activeColor: Colors.white,
            backgroundColor: Colors.transparent, // Background color set to transparent for gradient effect
            tabBackgroundColor: const Color(0xFFde5e5f),
            padding: EdgeInsets.all(16.r),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                leading: ImageIcon(
                  const AssetImage('assets/images/home.png'),
                  color: Colors.white,
                  size: 24.w,
                ),
                text: 'الرئيسية',
              ),
              GButton(
                leading: ImageIcon(
                  const AssetImage('assets/images/ideas.png'),
                  color: Colors.white,
                  size: 24.w,
                ),
                icon: Icons.quiz,
                text: 'الاختبارات',
              ),
              GButton(
                leading: ImageIcon(
                  const AssetImage('assets/images/course (2).png'),
                  color: Colors.white,
                  size: 24.w,
                ),
                icon: Icons.play_arrow_outlined,
                text: 'دوراتي',
              ),
              GButton(
                leading: ImageIcon(
                  const AssetImage('assets/images/account.png'),
                  color: Colors.white,
                  size: 24.w,
                ),
                icon: Icons.account_circle_outlined,
                text: 'الملف الشخصي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
