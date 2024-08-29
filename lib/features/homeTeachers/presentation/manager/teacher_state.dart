part of 'teacher_cubit.dart';

@immutable
sealed class TeacherState {}

final class TeacherInitial extends TeacherState {}
final class TeacherLoading extends TeacherState {}
final class TeacherError extends TeacherState {
  final String failure;

  TeacherError(this.failure);
}
final class TeacherLoaded extends TeacherState {
  final List<Teacher> teachers;

  TeacherLoaded(this.teachers);
}
