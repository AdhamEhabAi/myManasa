// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_manasa/constants.dart';
// import 'package:my_manasa/core/utils/styles.dart';
// import 'package:my_manasa/core/widgets/custom_appbar.dart';
// import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
// import 'package:my_manasa/features/homeTeachers/presentation/views/widgets/teacher_view_header.dart';
// import 'package:my_manasa/features/myCourses/presentation/views/my_course_view.dart';
// import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_course_widget.dart';
//
// class MyCoursesTeacherView extends StatelessWidget {
//   const MyCoursesTeacherView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: const CustomAppBar(
//           title: 'اللغة العربية',
//           backGroundColor: Colors.transparent,
//           iconColor: AppColors.primaryColor,
//           titleColor: AppColors.primaryColor,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(top: AppPadding.padding),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children: [
//                  TeacherViewHeader(teacher: Teacher(
//                      id: 'id',
//                      filterTeatcher: 'filterTeatcher',
//                      fname: 'fname',
//                      lname: 'lname',
//                      fnum: 'fnum',
//                      lnum: 'lnum',
//                      yr: 'yr',
//                      sec: 'sec',
//                      email: 'email',
//                      uname: 'uname',
//                      img: 'img',
//                      upass: 'upass',
//                      rank: 'rank',
//                      active: 'active',
//                      rnk: '2',
//                      otname: 'otname'),),
//                 Padding(
//                   padding: const EdgeInsets.all(AppPadding.padding),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'الكورسات',
//                         style: Styles.semiBold20,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         height: 2,
//                         width: MediaQuery.of(context).size.width,
//                         color: Colors.grey,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: ListView.separated(
//                       scrollDirection: Axis.vertical,
//                       itemBuilder: (context, index) {
//                         return MyCoursesCourseWidget(
//                           onTap: () {
//                             Get.to( MyCourseView(),
//                                 transition: Transition.fade);
//                           },
//                         );
//                       },
//                       separatorBuilder: (context, index) => const SizedBox(
//                         height: 20,
//                       ),
//                       itemCount: 4),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
