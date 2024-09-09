part of 'my_courses_cubit.dart';

@immutable
sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}
final class CourseVideoPdfChanged extends MyCoursesState {
  final bool isVideo;

  CourseVideoPdfChanged(this.isVideo);

}
final class CourseVideoPdfSwitched extends MyCoursesState {}


class MyCoursesLoading extends MyCoursesState {}

class MyCoursesLoaded extends MyCoursesState {
  final List<CourseModel> courses;
  MyCoursesLoaded(this.courses);
}

class MyCoursesError extends MyCoursesState {
  final String message;
  MyCoursesError(this.message);
}
