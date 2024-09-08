part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class HomeInitial extends SubjectState {}

class SubjectsLoading extends SubjectState {}

class SubjectsSuccess extends SubjectState {}

class SubjectsFail extends SubjectState {
  final String message;
  SubjectsFail(this.message);
}

class CourseVideoPdfSwitched extends SubjectState {}

class CourseVideoPdfChanged extends SubjectState {
  final bool isVideo;
  CourseVideoPdfChanged(this.isVideo);
}

// New States for Teachers
class AllTeachersLoading extends SubjectState {}

class AllTeachersLoaded extends SubjectState {

}

class AllTeachersFail extends SubjectState {
  final String message;
  AllTeachersFail(this.message);
}
