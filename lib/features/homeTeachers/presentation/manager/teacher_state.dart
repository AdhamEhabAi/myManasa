part of 'teacher_cubit.dart';

@immutable
sealed class TeacherState {}

final class TeacherInitial extends TeacherState {}

final class TeacherLoading extends TeacherState {}

final class TeacherError extends TeacherState {
  final String failure;

  TeacherError(this.failure);
}

final class TeacherLoaded extends TeacherState {}

final class CoursesLoading extends TeacherState {}

final class CoursesError extends TeacherState {
  final String failure;

  CoursesError(this.failure);
}

final class CoursesLoaded extends TeacherState {}

// New state to handle checking course ownership
final class CheckOwnershipLoading extends TeacherState {}

final class CheckOwnershipLoaded extends TeacherState {
  final bool isOwned;

  CheckOwnershipLoaded(this.isOwned);
}

final class CheckOwnershipError extends TeacherState {
  final String failure;

  CheckOwnershipError(this.failure);
}
