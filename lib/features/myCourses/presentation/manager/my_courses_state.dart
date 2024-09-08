part of 'my_courses_cubit.dart';

@immutable
sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}
final class CourseVideoPdfChanged extends MyCoursesState {
  final bool isVideo;

  CourseVideoPdfChanged(this.isVideo);

}
final class CourseVideoPdfSwitched extends MyCoursesState {}
final class VideosLoading extends MyCoursesState {}
final class VideosError extends MyCoursesState {
  final String errMessage;

  VideosError(this.errMessage);
}
final class VideoLoadingSuccess extends MyCoursesState {
  final List<VideoModel> videos;

  VideoLoadingSuccess(this.videos);
}


