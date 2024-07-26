part of 'my_courses_cubit.dart';

@immutable
sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}
final class CourseVideoPdfChanged extends MyCoursesState {
  final bool isVideo;

  CourseVideoPdfChanged(this.isVideo);

}
final class CourseVideoPdfSwitched extends MyCoursesState {}

