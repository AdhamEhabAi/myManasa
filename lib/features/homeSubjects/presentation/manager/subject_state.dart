part of '../../../homeSubjects/presentation/manager/subject_cubit.dart';

@immutable
sealed class SubjectState {}

final class HomeInitial extends SubjectState {}
class CourseVideoPdfSwitched extends SubjectState {}

class CourseVideoPdfChanged extends SubjectState {
  final bool isVideo;

  CourseVideoPdfChanged(this.isVideo);
}

class SubjectsLoading extends SubjectState {}
class SubjectsSuccess extends SubjectState {
 final List<SubjectModel> subjects;

  SubjectsSuccess(this.subjects);
}
class SubjectsFail extends SubjectState {
  final String errMessage;

  SubjectsFail(this.errMessage);
}
