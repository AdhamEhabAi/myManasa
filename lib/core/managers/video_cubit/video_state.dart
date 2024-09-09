part of 'video_cubit.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}
final class VideosLoading extends VideoState {}
final class VideosError extends VideoState {
  final String errMessage;

  VideosError(this.errMessage);
}
final class VideoLoadingSuccess extends VideoState {
  final List<VideoModel> videos;

  VideoLoadingSuccess(this.videos);
}