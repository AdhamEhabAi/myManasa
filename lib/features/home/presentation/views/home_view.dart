import 'package:flutter/material.dart';
import 'package:my_manasa/core/widgets/main_background.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/home_teachers_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_subjects_widget.dart';
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
                  HomeHeader(),
                  HomeSubjectsWidget(),
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



