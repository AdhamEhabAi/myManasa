import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/features/myCourses/data/models/video_model.dart';
import 'package:my_manasa/features/myCourses/repo/video_repo.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final VideoRepo videoRepo;

  MyCoursesCubit({required this.videoRepo}) : super(MyCoursesInitial());

  bool isVideo = false;

  void switchComplete() {
    isVideo = !isVideo;
    emit(CourseVideoPdfSwitched());
  }

  void onPageChanged(int index) {
    isVideo = index != 1;
    emit(CourseVideoPdfChanged(isVideo));
  }

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
