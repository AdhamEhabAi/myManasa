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
