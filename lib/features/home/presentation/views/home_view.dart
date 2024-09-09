import 'package:flutter/material.dart';
import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/home_teachers_widget.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/home_subjects_widget.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            HomeSubjectsWidget(),
            HomeTeachersWidget(),

          ],
        ),
      ),
    );
  }
}



