part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuizHomeworkModel> quizzes;

  QuizLoaded({required this.quizzes});
}

class QuizError extends QuizState {
  final String message;

  QuizError({required this.message});
}

class ExamLoading extends QuizState {}

class ExamLoaded extends QuizState {
  final List<ExamQuestion> questions;

  ExamLoaded(this.questions);
}

class ExamError extends QuizState {
  final String message;

  ExamError({required this.message});
}

class ExamEmpty extends QuizState {}
