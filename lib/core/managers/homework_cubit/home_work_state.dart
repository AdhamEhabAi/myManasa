part of 'home_work_cubit.dart';

@immutable
sealed class HomeWorkState {}

final class HomeWorkInitial extends HomeWorkState {}

final class HomeWorkLoading extends HomeWorkState {}

final class HomeWorkLoaded extends HomeWorkState {
  final List<QuizHomeworkModel> homeWorks;

  HomeWorkLoaded(this.homeWorks);
}

final class HomeWorkError extends HomeWorkState {
  final String message;

  HomeWorkError(this.message);
}
