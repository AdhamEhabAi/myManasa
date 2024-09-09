import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/features/myCourses/data/models/video_model.dart';
import 'package:my_manasa/features/myCourses/repo/video_repo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.videoRepo) : super(VideoInitial());
  final VideoRepo videoRepo;


  Future<void> fetchVideos({required String courseId}) async {
    emit(VideosLoading());

    Either<Failure, List<VideoModel>> result =
    await videoRepo.getVideos(courseId: courseId);

    result.fold(
          (failure) => emit(VideosError(failure.message)),
          (videos) => emit(VideoLoadingSuccess(videos)),
    );
  }

}
