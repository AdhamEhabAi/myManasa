import 'package:flutter/material.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_teachers_widget.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_courses_widget.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              MainBackGround(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppPadding.padding),
                    child: HomeHeader(),
                  ),
                  HomeCoursesWidget(),
                  HomeTeachersWidget(),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



