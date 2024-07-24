part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class CourseVideoPdfSwitched extends HomeState {}

class CourseVideoPdfChanged extends HomeState {
  final bool isVideo;

  CourseVideoPdfChanged(this.isVideo);
}

