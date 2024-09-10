import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/app_repository/code_repo.dart';
import 'package:my_manasa/core/app_repository/homework_repo.dart';
import 'package:my_manasa/core/app_repository/quiz_repo.dart';
import 'package:my_manasa/core/managers/code_cubit/code_cubit.dart';
import 'package:my_manasa/core/managers/homework_cubit/home_work_cubit.dart';
import 'package:my_manasa/core/managers/pdf_cubit/pdf_cubit.dart';
import 'package:my_manasa/core/managers/quiz_cubit/quiz_cubit.dart';
import 'package:my_manasa/core/managers/video_cubit/video_cubit.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:my_manasa/features/authentication/presentation/views/splash_view.dart';
import 'package:my_manasa/features/authentication/repo/auth_repo.dart';
import 'package:my_manasa/features/homeSubjects/presentation/manager/subject_cubit.dart';
import 'package:my_manasa/features/homeSubjects/repo/subject_repo.dart';
import 'package:my_manasa/features/homeTeachers/presentation/manager/teacher_cubit.dart';
import 'package:my_manasa/features/homeTeachers/presentation/repo/teacher_repo.dart';
import 'package:my_manasa/features/myCourses/presentation/manager/my_courses_cubit.dart';
import 'package:my_manasa/features/myCourses/repo/my_courses_repo.dart';
import 'package:my_manasa/features/myCourses/repo/pdf_repo.dart';
import 'package:my_manasa/features/myCourses/repo/video_repo.dart';
import 'package:my_manasa/features/profile/presentation/manager/profile_cubit.dart';
import 'package:my_manasa/features/profile/repo/profile_repo.dart';
import 'package:my_manasa/features/search/presentation/manager/search_cubit.dart';
import 'package:my_manasa/features/search/repo/search_repo.dart';
import 'package:my_manasa/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => SubjectCubit(SubjectRepo(ApiService()))),
            BlocProvider(create: (context) => MyCoursesCubit(MyCoursesRepo(ApiService()))),
            BlocProvider(create: (context) => CodeCubit(CodeRepo())),
            BlocProvider(create: (context) => SearchCubit(SearchRepo(ApiService()))),

            BlocProvider(
                create: (context) => TeacherCubit(TeacherRepo(ApiService()))),
            BlocProvider(
                create: (context) => AuthCubit(AuthRepo(ApiService()))),
            BlocProvider(
                create: (context) => ProfileCubit(ProfileRepo(ApiService()))),
            BlocProvider(
                create: (context) => VideoCubit(VideoRepo(ApiService()))),
            BlocProvider(create: (context) => PdfCubit(PdfRepo(ApiService()))),
            BlocProvider(create: (context) => QuizCubit(QuizRepo(ApiService()))),
            BlocProvider(create: (context) => HomeWorkCubit(HomeWorkRepo(ApiService()))),


          ],
          child: GetMaterialApp(
            locale: const Locale('ar', 'AE'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'AE'),
            ],
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
            builder: (context, widget) {
              return MediaQuery(
                // This ensures that text scales properly with the system's text scaling settings
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}
